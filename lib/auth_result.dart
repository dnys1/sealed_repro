import 'package:sealed_repro/base_exception.dart';

sealed class AuthResult {}

final class AuthSuccessResult extends AuthResult {}

final class AuthPartialSuccessResult extends AuthResult {
  AuthPartialSuccessResult({
    this.step1Exception,
    this.step2Exception,
  });

  final Step1Exception? step1Exception;
  final Step2Exception? step2Exception;
}

final class AuthFailureResult extends AuthResult {
  AuthFailureResult(this.exception);

  final AuthException exception;
}

final class Step1Exception extends UnknownException {}

final class Step2Exception extends AuthServiceException {}
