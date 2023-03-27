import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterDetailPageRepoImpl implements RegisterDetailPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterDetailPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<RegisterRespModel, Failure>> register({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required String countryCode,
    required String dialCode,
    required String phone,
    required String emiratesId,
    required String gender,
    required String birth,
    required String passport,
  }) async {
    final response = await networkHelper.post(
      endPoints.getRegisterEndPoint(),
      headers: endPoints.headers,
      body: {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'countryCode': countryCode,
        'dialCode': dialCode,
        'phone': phone,
        'emiratesID': emiratesID,
        'gender': gender,
        'birth': birth,
        'passport': passport,
      },
    );
    return response.fold(
      (success) {
        return Left(
          registerRespModelFromJson(success),
        );
      },
      (r) {
        return Right(
          Failure(
            status: r.status,
            message: r.message,
          ),
        );
      },
    );
  }
}
