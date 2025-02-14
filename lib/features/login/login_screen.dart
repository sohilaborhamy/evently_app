
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constants/assets_app.dart';

import '../../core/extensions/validate.dart';
import '../../core/helper/custom_button_widget.dart';
import '../../core/helper/custom_container_widget.dart';
import '../../core/helper/custom_text_field.dart';

import '../../core/routes/screens_route_name.dart';
import '../../core/theme/colors_app.dart';
import '../../core/utils/firebase_services.dart';
import '../forget_password/forget_password.dart';
import '../profile/profile_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsApp.logoSplash,
                  height: 0.25 * height,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _emailController,
                  hint: "Email",
                  hintColor: ColorsApp.generalGreyColor,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.emailIcon),
                    color: ColorsApp.generalGreyColor,
                  ),
                   onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your  e-mail";
                    }
                    if (!Validations.validateEmail(value)) {
                      return "please enter your a valid e-mail";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  isPassword: true,
                  maxLines: 1,
                  hint: "Password",
                  hintColor: ColorsApp.generalGreyColor,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.lockIcon),
                    color: ColorsApp.generalGreyColor,
                  ),
                   onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your  password";
                    }
                    if (!Validations.validatePassword(value)) {
                      return "please enter your a valid password";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen()),
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorsApp.secondColorLight,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsApp.secondColorLight,
                      ),
                    ),
                  ),
                ),
                CustomButtonWidget(
                   onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseServices.signIn(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ScreenRouteName.profile, (route) => false);
                        }
                      });
                    }
                  },
                  buttonText: "Login",
                 
                ),
                const SizedBox(height: 10),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t Have Account? ",
                        style: theme.textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Create Account",
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: ColorsApp.secondColorLight,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorsApp.secondColorLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: ColorsApp.secondColorLight,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Text(
                      "OR",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorsApp.secondColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: ColorsApp.secondColorLight,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Google login
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorsApp.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: const BorderSide(
                          color: ColorsApp.secondColorLight,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsApp.googleIcon,
                          height: 0.03 * height,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Login With Google",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.secondColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140),
                  child: CustomContainerWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
