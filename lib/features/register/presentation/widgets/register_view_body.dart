import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_text_form_field.dart';
import 'package:islami/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:islami/features/login/presentation/widgets/logo_object.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: AppSize.s30),
                Text(
                  'Register Now',
                  style: StylesManager.textStyle24(ColorManager.primaryColor),
                ),
                const SizedBox(height: AppSize.s30),
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
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s125),
                    child: Text(StringsManager.register),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    StringsManager.haveAnAcountText,
                    style: StylesManager.textStyle14(ColorManager.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
