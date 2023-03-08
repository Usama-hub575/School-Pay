import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin FirebaseRepo {
  Future<Either<FirebaseRemoteConfigModel, Failure>> initializeRemoteConfig();
}
