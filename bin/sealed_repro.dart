import 'package:sealed_repro/auth_result.dart';
import 'package:sealed_repro/base_exception.dart';

Future<AuthResult> performAuthOperation() async {
  throw UnimplementedError();
}

Future<void> inferExceptionType() async {
  final result = await performAuthOperation();
  switch (result) {
    case AuthSuccessResult _:
      print('Success');
    case AuthPartialSuccessResult(step1Exception: final exception?) ||
          AuthPartialSuccessResult(step2Exception: final exception?) ||
          AuthFailureResult(:final exception):
      print('Partially failed: $exception');
    // For exhaustiveness; should never happen.
    case AuthPartialSuccessResult(step1Exception: null, step2Exception: null):
      print('Unknown error occurred');
  }
}

Future<void> explicitExceptionType() async {
  final result = await performAuthOperation();
  switch (result) {
    case AuthSuccessResult _:
      print('Success');
    case AuthPartialSuccessResult(step1Exception: final AuthException exception) ||
          AuthPartialSuccessResult(step2Exception: final AuthException exception) ||
          AuthFailureResult(:final AuthException exception):
      print('Partially failed: $exception');
    // For exhaustiveness; should never happen.
    case AuthPartialSuccessResult(step1Exception: null, step2Exception: null):
      print('Unknown error occurred');
  }
}

Future<void> main() => explicitExceptionType();
