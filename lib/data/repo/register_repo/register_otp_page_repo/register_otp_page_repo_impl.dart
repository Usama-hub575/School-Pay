import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPageRepoImpl implements RegisterOTPPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterOTPPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<OTPVerifyResModel, Failure>> verifyOTP({
    required String phoneNumber,
    required String otpCode,
  }) async {
    final response = await networkHelper.post(
      endPoints.getVerifyOTPEndPoint(),
      headers: endPoints.headers,
      body: {
        "phone": phoneNumber,
        "otp": otpCode,
      },
    );
    return response.fold(
      (success) {
        return Left(
          oTPVerifyResModelFromJson(success),
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

// var endPoint = Uri.parse("$baseUrl$sendOTP");
// var response = await client.post(
//   endPoint,
//   headers: headers,
//   body: data,
// );
// print("Login Data");
// print(response.body);
// if (response.statusCode == 200) {
//   return response.body;
// } else {
//   return response.body;
// }
}
