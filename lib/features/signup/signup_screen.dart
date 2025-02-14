import 'package:evently_app/core/extensions/validate.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/utils/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../core/constants/assets_app.dart';

import '../../core/helper/custom_button_widget.dart';
import '../../core/helper/custom_container_widget.dart';
import '../../core/helper/custom_text_field.dart';

import '../../core/theme/colors_app.dart';
import '../../providers/app_theme_provider.dart';
import '../login/login_screen.dart';
import '../profile/profile_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDark();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? ColorsApp.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Register",
          style: TextStyle(
            color: isDarkMode ? ColorsApp.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
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
                  controller: _nameController,
                  hint: "Name",
                  hintColor: ColorsApp.generalGreyColor,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.personIcon),
                    color: ColorsApp.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                CustomTextField(
                  isPassword: true,
                  maxLines: 1,
                  hint: "Re Password",
                  hintColor: ColorsApp.generalGreyColor,
                  prefixIcon: ImageIcon(
                    AssetImage(AssetsApp.lockIcon),
                    color: ColorsApp.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your  password";
                    }
                    if (value != _passwordController.text) {
                      return "re password not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseServices.signUp(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              ScreenRouteName.loginScreen, (route) => false);
                        }
                      });
                    }
                  },
                  buttonText: "Create Account",
                ),
                const SizedBox(height: 10),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account? ",
                        style: theme.textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
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
