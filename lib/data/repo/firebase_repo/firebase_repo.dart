import 'export.dart';

mixin FirebaseRepo {
  Future<Either<FirebaseRemoteConfigModel, Failure>> initializeRemoteConfig();
}
