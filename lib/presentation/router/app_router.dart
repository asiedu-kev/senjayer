import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/main_screen_cubit.dart';
import 'package:senjayer/business_logic/cubit/onboarding_cubit.dart';
import 'package:senjayer/business_logic/cubit/password_cubit.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/presentation/screens/authentication/login/login_screen.dart';
import 'package:senjayer/presentation/screens/event_detail/event_detail_screen.dart';
import 'package:senjayer/presentation/screens/event_list/event_list_screen.dart';
import 'package:senjayer/presentation/screens/favorites/favorite_screen.dart';
import 'package:senjayer/presentation/screens/main_screen/main_screen.dart';
import 'package:senjayer/presentation/screens/notifications/notifications_screen.dart';
import 'package:senjayer/presentation/screens/otp/otp_screen.dart';
import 'package:senjayer/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:senjayer/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/new_password_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/password_recup_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/successful_operation.dart';
import 'package:senjayer/presentation/screens/splash/splash_screen.dart';
import 'package:senjayer/presentation/screens/spotlight/spotlight_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OnBoardingCubit(),
                  lazy: true,
                  child: const OnBoardingScreen(),
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
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => OTPScreen(
                  title: arguments["title"],
                  otpMethod: arguments["otp_method"],
                ));

      case '/passwordRecup':
        return MaterialPageRoute(builder: (_) => const PasswordRecupScreen());

      case '/newPassword':
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());

      case '/successfulOperation':
        return MaterialPageRoute(
            builder: (_) => const SuccessfulOperationScreen());

      case '/main':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MainScreenCubit(),
            child: const MainScreen(),
          ),
        );

      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      case '/favorites':
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());

      case '/spotlight':
        return MaterialPageRoute(builder: (_) => const SpotlightScreen());

      case '/eventList':
        final argument = settings.arguments as EventList;
        return MaterialPageRoute(
          builder: (_) => EventListScreen(
            eventList: argument,
          ),
        );
    
      case '/eventDetail':
        return MaterialPageRoute(builder: (_) => const EventDetailScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
