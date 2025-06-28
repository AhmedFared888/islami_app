import 'package:flutter/material.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/core/resources/styles_manager.dart';
import 'package:islami/core/resources/values_manager.dart';
import 'package:islami/core/widgets/custom_text_form_field.dart';
import 'package:islami/features/login/presentation/widgets/logo_object.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoObject(),
                SizedBox(height: AppSize.s40),
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
                SizedBox(height: AppSize.s30),
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
                SizedBox(height: AppSize.s30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // valid input
                    }
                  },
                  child: Padding(
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
                    Spacer(),
                    TextButton(
                      onPressed: () {},
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
  }
}
