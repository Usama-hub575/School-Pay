

import 'package:get_it/get_it.dart';
import 'package:paynest_flutter_app/di/export.dart';

GetIt it = GetIt.instance;

Future initializeDependencies() async {
  await Future.wait(
    [
      initializeNetworkDependencies(),
      initializeRepoDependencies(),
      initializeUseCaseDependencies(),
    ],
  );
}
