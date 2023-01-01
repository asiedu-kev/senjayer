import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LocalDataRepository localDataRepository;

  AuthenticationBloc({required this.localDataRepository})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(
      (event, emit) async {
        final bool rememberUser = await localDataRepository.rememberUser();
        if (rememberUser) {
          final bool hasToken = await localDataRepository.hasToken();
          if (hasToken) {
            final String token = await localDataRepository.getToken();
            log(token);
            emit(AuthenticationAuthenticated());
          } else {
            emit(AuthenticationUnauthenticated());
          }
        } else {
          localDataRepository.deleteToken();
          emit(AuthenticationUnauthenticated());
        }
      },
    );
    on<LoggedIn>(
      (event, emit) async {
        emit(AuthenticationLoading());
        await localDataRepository.persistToken(event.token);/* 
        await localDataRepository.persistPhone(event.user.phone); */
        await localDataRepository.persistUser(event.user);
        emit(AuthenticationAuthenticated());
      },
    );
    on<LoggedOut>(
      (event, emit) async {
        emit(AuthenticationLoading());
        await localDataRepository.deleteToken();
        await localDataRepository.clearRememberMe();/* 
        await localDataRepository.deletePhone(); */
        emit(AuthenticationUnauthenticated());
      },
    );
  }
}
