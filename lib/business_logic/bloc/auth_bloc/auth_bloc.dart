import 'package:bloc/bloc.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LocalDataRepository localDataRepository;

  AuthenticationBloc({required this.localDataRepository})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(
      (event, emit) async {
        final bool hasToken = await localDataRepository.hasToken();
        if (hasToken) {
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
      },
    );
    on<LoggedIn>(
      (event, emit) async {
        emit(AuthenticationLoading());
        await localDataRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      },
    );
    on<LoggedOut>(
      (event, emit) async {
        emit(AuthenticationLoading());
        await localDataRepository.deleteToken();
        emit(AuthenticationUnauthenticated());
      },
    );
  }
}