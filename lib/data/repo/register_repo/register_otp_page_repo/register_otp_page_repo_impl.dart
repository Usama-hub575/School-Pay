import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPageRepoImpl implements RegisterOTPPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterOTPPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });
}
