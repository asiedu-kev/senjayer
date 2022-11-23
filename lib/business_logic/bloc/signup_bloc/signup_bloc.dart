import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'signup.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignupBloc({
    required this.authRepository,
    required this.authenticationBloc,
  }) : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(
        SignupLoading(),
      );

      try {
        final loginEither = await authRepository.register(
          event.name,
          event.phone,
          event.email,
          event.password,
          event.passwordConfirmation,
        );
        loginEither.fold((error) {
          throw error;
        }, (responseData) {
          authenticationBloc.add(
            LoggedIn(
              token: responseData["access_token"],
              user: User.fromMap(
                responseData["user"],
              ),
            ),
          );
        });
      } on DioError catch (error) {
        emit(
          SignupFailure(
            error: error.toString(),
          ),
        );
      } catch (error) {
        emit(
          SignupFailure(
            error: error.toString(),
          ),
        );
      }
    });
  }
}
