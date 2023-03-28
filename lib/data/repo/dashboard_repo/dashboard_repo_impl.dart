import 'package:paynest_flutter_app/export.dart';

class DashboardRepoImpl implements DashboardRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  DashboardRepoImpl({
    required this.storage,
    required this.networkHelper,
  });
}
