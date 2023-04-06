import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterMainPageRepoImpl implements RegisterMainPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterMainPageRepoImpl({
    required this.networkHelper,
    required this.storage,
  });

  @override
  Future<Either<OTPResponseModel, Failure>> sendOTP({
    required String email,
    required String phone,
    required String dialCode,
  }) async {
    final response = await networkHelper.post(
      endPoints.getSendOTPEndPoint(),
      headers: endPoints.headers,
      body: {
        'email': email,
        'phone': phone,
        'dialCode': dialCode,
      },
    );
    return response.fold(
      (success) {
        return Left(
          OTPResponseModel.fromJson(
            jsonDecode(success),
          ),
        );
      },
      (error) {
        return Right(
          Failure(
            status: error.status,
            message: error.message,
          ),
        );
      },
    );
  }
}
