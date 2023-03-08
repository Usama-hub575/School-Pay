import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin InitializerRepo {
  String getString(String key);

  Future<Either<CountriesResponse, Failure>> getCountries();
}
