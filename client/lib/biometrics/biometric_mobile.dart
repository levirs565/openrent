import 'package:local_auth/local_auth.dart';

final _localAuth = LocalAuthentication();

Future<bool> isBiometricSupported() async {
  return await _localAuth.canCheckBiometrics;
}

Future<bool> biometricAuthenticate({required String reason}) async {
  try {
    return await _localAuth.authenticate(
      localizedReason: reason,
    );
  } on LocalAuthException catch (e) {
    switch (e.code) {
      case LocalAuthExceptionCode.authInProgress:
        throw Exception("Auth in progress");
      case LocalAuthExceptionCode.uiUnavailable:
        throw Exception("Biometric UI unavailable");
      case LocalAuthExceptionCode.userCanceled:
        throw Exception("Authentication canceled by user");
      case LocalAuthExceptionCode.timeout:
        throw Exception("Authentication timed out");
      case LocalAuthExceptionCode.systemCanceled:
        throw Exception("Authentication canceled by system");
      case LocalAuthExceptionCode.noCredentialsSet:
        throw Exception("No credentials set on device");
      case LocalAuthExceptionCode.noBiometricsEnrolled:
        throw Exception("No biometrics enrolled");
      case LocalAuthExceptionCode.noBiometricHardware:
        throw Exception("No biometric hardware found");
      case LocalAuthExceptionCode.biometricHardwareTemporarilyUnavailable:
        throw Exception("Biometric hardware temporarily unavailable");
      case LocalAuthExceptionCode.temporaryLockout:
        throw Exception("Temporary lockout due to too many attempts");
      case LocalAuthExceptionCode.biometricLockout:
        throw Exception("Biometric lockout");
      case LocalAuthExceptionCode.userRequestedFallback:
        throw Exception("User requested fallback");
      case LocalAuthExceptionCode.deviceError:
        throw Exception("Biometric device error");
      case LocalAuthExceptionCode.unknownError:
        throw Exception("Unknown biometric error");
    }
  }
}
