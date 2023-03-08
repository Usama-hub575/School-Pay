import 'package:paynest_flutter_app/export.dart';

class LocalAuthApi {
  static Future<bool> authenticateWithBiometrics() async {
    LocalAuthentication localAuthentication = LocalAuthentication();
    // bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    // bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    List<BiometricType> biometricTypes =
        (await localAuthentication.getAvailableBiometrics())
            .cast<BiometricType>();
    bool isAuthenticated = false;
    if (Platform.isIOS) {
      if (biometricTypes.contains(BiometricType.face)) {
        // Face ID.
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Scan Face to Proceed',
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true);
      } else if (biometricTypes.contains(BiometricType.fingerprint)) {
        // Touch ID.
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Scan Fingerprint to Proceed',
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true);
      }
    }
    if (Platform.isAndroid) {
      if (biometricTypes.contains(BiometricType.face)) {
        // Face ID.
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Scan Face to Proceed',
            biometricOnly: true,
            // stickyAuth: true,
            useErrorDialogs: true);
      } else if (biometricTypes.contains(BiometricType.fingerprint)) {
        //Touch ID.
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan Fingerprint to Proceed',
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        );
      }
    }
    return isAuthenticated;
  }
}
