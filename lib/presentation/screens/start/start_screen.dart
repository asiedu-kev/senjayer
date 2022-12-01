import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/business_logic/bloc/category_bloc/categories_bloc.dart';
import 'package:senjayer/business_logic/bloc/login_bloc/login.dart';
import 'package:senjayer/business_logic/cubit/main_screen/main_screen_cubit.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'package:senjayer/presentation/screens/authentication/login/login_screen.dart';
import 'package:senjayer/presentation/screens/main_screen/main_screen.dart';
import 'package:senjayer/utils/constants.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MainScreenCubit(),
              ),
              BlocProvider(
                create: (context) => CategoriesBloc(),
              ),
            ],
            child: const MainScreen(),
          );
        }
        if (state is AuthenticationUnauthenticated) {
          final AuthRepository authRepository = AuthRepository();
          return BlocProvider(
            create: (context) => LoginBloc(
              authRepository: authRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            ),
            child: const LoginScreen(),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppConstants().purple,
              ),
            ),
          );
        }
      },
    );
  }
}
