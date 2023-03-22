import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPageUseCase {
  RegisterOTPPageUseCase({
    required this.registerOTPPageRepo,
  });

  RegisterOTPPageRepo registerOTPPageRepo;

  // bool isLoading = false;
  // bool status = false;
  // String errorMessage = "";
  // OtpResponseModel otpResponse = OtpResponseModel(requestId: null, type: null);
  //
  // hitSendOTP(email, userPhone, dialCode) async {
  //   try {
  //     isLoading = true;
  //     OtpModel otpData =
  //         OtpModel(email: email, phone: userPhone, dailCode: dialCode);
  //
  //     final response = await registerOTPPageRepo.apiSendOTP(
  //       otpModelToJson(otpData),
  //     );
  //     final decoded = jsonDecode(
  //       response.toString(),
  //     );
  //     if (decoded['status']) {
  //       status = decoded['status'] ?? false;
  //       errorMessage = decoded['message'] ?? "";
  //       OtpResponseModel responseModel = otpResponseModelFromJson(
  //         response.toString(),
  //       );
  //       otpResponse = responseModel;
  //
  //       otpResponse;
  //       // print(lrm.message);
  //     } else if (!(decoded['status'] as bool)) {
  //       status = decoded['status'] ?? false;
  //       errorMessage = decoded['message'] ?? "";
  //       isLoading = false;
  //     }
  //   } finally {
  //     isLoading = false;
  //   }
  // }
}
