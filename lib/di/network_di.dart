import '../data/export.dart';
import 'export.dart';

Future initializeNetworkDependencies() async {
  it.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(),
  );
}
