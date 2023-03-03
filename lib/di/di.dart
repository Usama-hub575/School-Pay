import 'export.dart';

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
