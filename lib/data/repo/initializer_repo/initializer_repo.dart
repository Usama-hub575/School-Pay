import 'export.dart';

mixin InitializerRepo {
  String getString(String key);

  Future<Either<CountriesResponse, Failure>> getCountries();
}
