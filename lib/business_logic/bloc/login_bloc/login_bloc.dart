import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.authRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(
        LoginLoading(),
      );

      try {
        final loginEither = await authRepository.login(
          event.phone,
          event.password,
        );
        loginEither.fold(
          (error) {
            throw error;
          },
          (responseData) {
            authenticationBloc.add(
              LoggedIn(
                token: responseData["access_token"],
                user: User.fromMap(
                  responseData["user"],
                ),
              ),
            );
          },
        );
        emit(LoginInitial());
      } on DioError catch (error) {
        emit(
          LoginFailure(
            error: error.toString(),
          ),
        );
      } catch (error) {
        emit(
          LoginFailure(
            error: error.toString(),
          ),
        );
      }
    });
  }
}
