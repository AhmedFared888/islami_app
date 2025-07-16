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
import 'package:islami/features/auth/forget_password/presentation/manager/cubit/forgetpassword_cubit.dart';
import 'package:islami/features/auth/login/presentation/widgets/logo_object.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoadingIndicator(),
          );
        } else if (state is ForgetPasswordSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم إرسال رابط إلى ${state.email}')),
          );
          GoRouter.of(context).pushReplacement(RoutesManager.loginRoute);
        } else if (state is ForgetPasswordFailure) {
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
                            StringsManager.enterYourEmail,
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
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<ForgetPasswordCubit>(
                                context,
                              ).resetPassword(
                                email: _userNameController.text.trim(),
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s100,
                            ),
                            child: Text(StringsManager.resetPassword),
                          ),
                        ),
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
