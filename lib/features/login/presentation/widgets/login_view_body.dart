import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_loading_indicator.dart';
import 'package:islami/core/widgets/custom_text_form_field.dart';
import 'package:islami/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:islami/features/login/presentation/widgets/logo_object.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoadingIndicator(),
          );
        } else if (state is LoginSuccess) {
          Navigator.of(context).pop();
          GoRouter.of(context).pushReplacement(RoutesManager.mainRoute);
        } else if (state is LoginFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoObject(),
                    const SizedBox(height: AppSize.s70),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringsManager.pleaseLogin,
                        style: StylesManager.textStyle24(
                          ColorManager.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    CustomTextFormField(
                      textEditingController: _userNameController,
                      hintText: StringsManager.userName,
                      labelText: StringsManager.userName,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        } else if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.s30),
                    CustomTextFormField(
                      textEditingController: _passwordController,
                      hintText: StringsManager.password,
                      labelText: StringsManager.password,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSize.s30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).loginUser(
                            email: _userNameController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSize.s140),
                        child: Text(StringsManager.login),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsManager.forgetPassword,
                            style: StylesManager.textStyle14(
                              ColorManager.primaryColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).push(RoutesManager.registerRoute);
                          },
                          child: Text(
                            StringsManager.registerText,
                            style: StylesManager.textStyle14(
                              ColorManager.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
