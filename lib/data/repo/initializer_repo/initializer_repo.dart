import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin InitializerRepo {
  String? getString({required String key});

  Future<Either<CountriesResponse, Failure>> getCountries();
}
