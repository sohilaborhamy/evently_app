import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:flutter/material.dart';

import '../../features/createEvent/create_new_event_view.dart';
import '../../features/forget_password/forget_password.dart';
import '../../features/layout/layout_view.dart';
import '../../features/login/login_screen.dart';
import '../../features/onboarding/screens/frist_onboarding_screen.dart';
import '../../features/onboarding/screens/onboarding_scroll_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/signup/signup_screen.dart';
import '../../features/splash/screens/splash_screen.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouteName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case ScreenRouteName.onboardingScoll:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScrollScreen(),
            settings: settings);
      case ScreenRouteName.profile:
        return MaterialPageRoute(
            builder: (context) => const ProfileScreen(), settings: settings);
      case ScreenRouteName.fristOnboardingScreen:
        return MaterialPageRoute(
            builder: (context) => const FristOnboardingScreen(),
            settings: settings);
      case ScreenRouteName.loginScreen:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);
      case ScreenRouteName.signupScreen:
        return MaterialPageRoute(
            builder: (context) => const SignupScreen(), settings: settings);
      case ScreenRouteName.forgetPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen(),
            settings: settings);
      case ScreenRouteName.layout:
        {
          return MaterialPageRoute(
            builder: (context) => const LayoutView(),
            settings: settings,
          );
        }
        case ScreenRouteName.createNewEvent:
        return MaterialPageRoute(
            builder: (context) => const CreateNewEventView(), settings: settings);
      

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
    }
  }
}
