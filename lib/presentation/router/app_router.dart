import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/onboarding_cubit.dart';
import 'package:senjayer/business_logic/cubit/password_cubit.dart';
import 'package:senjayer/main.dart';
import 'package:senjayer/presentation/screens/authentication/login/login_screen.dart';
import 'package:senjayer/presentation/screens/authentication/signup/otp_screen.dart';
import 'package:senjayer/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:senjayer/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:senjayer/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OnboardingCubit(),
                  lazy: true,
                  child: const OnboardingScreen(),
                ));

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/signup':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => PasswordCubit(),
                  child: const SingupScreen(),
                ));

      case '/otp':
        return MaterialPageRoute(builder: (_) => const OTPScreen());

      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
    }
  }
}
