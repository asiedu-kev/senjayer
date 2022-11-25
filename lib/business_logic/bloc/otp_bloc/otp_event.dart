part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OtpButtonPressed extends OtpEvent{
  final String code;
  final int? forceResendingToken;
  OtpButtonPressed({
    required this.code,
    this.forceResendingToken,
  });

  @override
  String toString() =>
      'ValidationButtonPressed(code: $code, forceResendingToken: $forceResendingToken)';
}