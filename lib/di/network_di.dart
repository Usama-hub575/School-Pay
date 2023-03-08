import 'package:paynest_flutter_app/export.dart';

Future initializeNetworkDependencies() async {
  it.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(),
  );
}
