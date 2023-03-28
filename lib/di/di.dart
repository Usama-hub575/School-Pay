import 'package:paynest_flutter_app/export.dart';

GetIt it = GetIt.instance;

Future<void> initializeDependencies() async {
  await Future.wait(
    [
      initializeNetworkDependencies(),
      initializeRepoDependencies(),
      initializeUseCaseDependencies(),
      initializeBlocs(),
    ],
  );
}
