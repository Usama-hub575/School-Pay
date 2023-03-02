import 'export.dart';

class InitializerRepoImpl implements InitializerRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  InitializerRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  String getString(String key) {
    return storage.getString(key: key) ?? '';
  }

  @override
  Future<Either<CountriesResponse, Failure>> getCountries() async {
    final response = await networkHelper.get(
      EndPoints().getCountriesEndPoint(),
    );

    return response.fold(
      (success) {
        return Left(
          CountriesResponse.fromJson(
            jsonDecode(success),
          ),
        );
      },
      (error) {
        return Right(
          Failure(
            message: error.message,
            status: false,
          ),
        );
      },
    );
  }
}
