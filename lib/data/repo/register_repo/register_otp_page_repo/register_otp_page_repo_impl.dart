import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPageRepoImpl implements RegisterOTPPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterOTPPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });
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
