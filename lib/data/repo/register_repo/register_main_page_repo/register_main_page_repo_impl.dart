import 'package:paynest_flutter_app/export.dart';

class RegisterMainPageRepoImpl implements RegisterMainPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterMainPageRepoImpl({
    required this.networkHelper,
    required this.storage,
  });
}
