import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin SignInRepo {
  Future<Either<AuthenticationModel, Failure>> apiLogin({
    String email = '',
    String password = '',
    String fcm = '',
  });

  String getString(String key);

  void setString(String key, dynamic value);

  bool getBool(String key);
}
