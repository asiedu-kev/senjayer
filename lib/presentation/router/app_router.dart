import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_event.dart'
    as obd;
import 'package:senjayer/business_logic/bloc/signup_bloc/signup.dart';
import 'package:senjayer/business_logic/cubit/main_screen_cubit.dart';
import 'package:senjayer/business_logic/cubit/onboarding_cubit.dart';
import 'package:senjayer/business_logic/cubit/password_cubit.dart';
import 'package:senjayer/business_logic/cubit/payment_method_cubit.dart';
import 'package:senjayer/business_logic/cubit/ticket_cubit.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';
import 'package:senjayer/presentation/screens/FAQ/faq_screen.dart';
import 'package:senjayer/presentation/screens/about_us/about_us_screen.dart';
import 'package:senjayer/presentation/screens/actor_detail/actor_detail_screen.dart';
import 'package:senjayer/presentation/screens/authentication/login/login_screen.dart';
import 'package:senjayer/presentation/screens/authentication/signup/signup_process.dart';
import 'package:senjayer/presentation/screens/buy_ticket/buy_ticket_screen.dart';
import 'package:senjayer/presentation/screens/choose_payment_method/choose_payment_method_screen.dart';
import 'package:senjayer/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:senjayer/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:senjayer/presentation/screens/event_detail/event_detail_screen.dart';
import 'package:senjayer/presentation/screens/event_list/event_list_screen.dart';
import 'package:senjayer/presentation/screens/favorites/favorite_screen.dart';
import 'package:senjayer/presentation/screens/main_screen/main_screen.dart';
import 'package:senjayer/presentation/screens/news_detail/news_detail_screen.dart';
import 'package:senjayer/presentation/screens/notifications/notifications_screen.dart';
import 'package:senjayer/presentation/screens/notifications_setting/notifications_setting_screen.dart';
import 'package:senjayer/presentation/screens/organizer_detail/organizer_detail_screen.dart';
import 'package:senjayer/presentation/screens/otp/otp_screen.dart';
import 'package:senjayer/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/new_password_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/password_recup_screen.dart';
import 'package:senjayer/presentation/screens/password_recovery/successful_operation.dart';
import 'package:senjayer/presentation/screens/profile/profile_screen.dart';
import 'package:senjayer/presentation/screens/room_detail/room_detail_screen.dart';
import 'package:senjayer/presentation/screens/settings/settings_screen.dart';
import 'package:senjayer/presentation/screens/splash/splash_screen.dart';
import 'package:senjayer/presentation/screens/spotlight/spotlight_screen.dart';
import 'package:senjayer/presentation/screens/start/start_screen.dart';
import 'package:senjayer/presentation/screens/tickets/tickets_screen.dart';

class AppRouter {
  final LocalDataRepository localDataRepository = LocalDataRepository();
  final AuthRepository authRepository = AuthRepository();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnboardingBloc(
              localDataRepository: localDataRepository,
            )..add(obd.AppStarted()),
            child: const SplashScreen(),
          ),
        );

      case '/start':
        return MaterialPageRoute(
          builder: (_) => const StartScreen(),
        );

      case '/onboarding':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => OnBoardingCubit(),
                lazy: true,
              ),
              BlocProvider(
                create: (context) => OnboardingBloc(
                  localDataRepository: localDataRepository,
                ),
              ),
            ],
            child: const OnBoardingScreen(),
          ),
        );

      /* case '/login':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginBloc(authenticationBloc: authRepository, authRepository: null,),
                  child: LoginScreen(),
                )); */

      case '/signup':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => PasswordCubit(),
                    ),
                    BlocProvider(
                      create: (context) => SignupBloc(
                        authenticationBloc:
                            BlocProvider.of<AuthenticationBloc>(context),
                        authRepository: authRepository,
                      ),
                    ),
                  ],
                  child: const SignupProcess(),
                ),);

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

      case '/organizerDetail':
        return MaterialPageRoute(builder: (_) => const OrganizerDetailScreen());

      case '/actorDetail':
        return MaterialPageRoute(builder: (_) => const ActorDetailScreen());

      case '/buyTicket':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TicketCubit(),
            child: const BuyTicketScreen(),
          ),
        );

      case '/choosePaymentMethod':
        final argument = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PaymentMethodCubit(),
            child: ChoosePaymentMethodScreen(totalAmount: argument),
          ),
        );

      case '/newsDetail':
        return MaterialPageRoute(builder: (_) => const NewsDetailScreen());

      case '/roomDetail':
        return MaterialPageRoute(builder: (_) => const RoomDetailScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );

      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      case '/tickets':
        return MaterialPageRoute(builder: (_) => const TicketsScreen());

      case '/notificationsSetting':
        return MaterialPageRoute(
            builder: (_) => const NotificationsSettingScreen());

      case '/faq':
        return MaterialPageRoute(builder: (_) => const FAQScreen());

      case '/aboutUs':
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      case '/contactUs':
        return MaterialPageRoute(builder: (_) => const COntactUsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
