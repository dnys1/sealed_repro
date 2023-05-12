abstract class BaseException implements Exception {}

sealed class AuthException implements BaseException {}

class UnknownException extends BaseException implements AuthException {}

class AuthServiceException extends AuthException {}
