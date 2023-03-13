import 'package:paynest_flutter_app/export.dart';

class RegisterDetailPageRepoImpl implements RegisterDetailPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  RegisterDetailPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });
}
