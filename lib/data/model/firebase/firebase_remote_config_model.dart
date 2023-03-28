class FirebaseRemoteConfigModel {
  String appPackage = '';
  String currentVersion = '';
  String baseUrl = '';
  String paymentGateway = '';
  String minAndroidVersion = '';
  String maxAndroidVersion = '';
  String minIosVersion = '';
  String maxIosVersion = '';

  FirebaseRemoteConfigModel({
    required this.appPackage,
    required this.currentVersion,
    required this.baseUrl,
    required this.paymentGateway,
    required this.minAndroidVersion,
    required this.maxAndroidVersion,
    required this.minIosVersion,
    required this.maxIosVersion,
  });

  static FirebaseRemoteConfigModel defaults() {
    return FirebaseRemoteConfigModel(
      appPackage: 'com.paynest.borderpay',
      baseUrl: 'https://stage-api.dubaismarttravel.ae/api',
      paymentGateway: 'https://staging.dubaismarttravel.ae/',
      currentVersion: '1.0.0',
      minAndroidVersion: '1.0.6',
      maxAndroidVersion: '1.0.6',
      minIosVersion: '1.0.6',
      maxIosVersion: '1.0.6',
    );
  }
}
