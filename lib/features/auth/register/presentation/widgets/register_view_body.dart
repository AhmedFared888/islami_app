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
import 'package:islami/features/auth/login/presentation/widgets/logo_object.dart';
import 'package:islami/features/auth/register/presentation/manager/cubit/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoadingIndicator(),
          );
        } else if (state is RegisterSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(StringsManager.accountCreatedSuccessfully)),
          );
          GoRouter.of(context).pushReplacement(RoutesManager.loginRoute);
        } else if (state is RegisterFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LogoObject(),
                        const SizedBox(height: AppSize.s70),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StringsManager.registerNow,
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
                        CustomTextFormField(
                          textEditingController: _confirmPasswordController,
                          hintText: StringsManager.confirmPassword,
                          labelText: StringsManager.confirmPassword,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s30),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterCubit>(context).register(
                                email: _userNameController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s125,
                            ),
                            child: Text(StringsManager.register),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(RoutesManager.loginRoute);
                          },
                          child: Text(
                            StringsManager.haveAnAcountText,
                            style: StylesManager.textStyle14(
                              ColorManager.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
