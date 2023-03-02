import 'package:paynest_flutter_app/domain/export.dart';

import '../presentation/bloc/export.dart';
import 'export.dart';

Future initializeBlocs() async {
  it.registerLazySingleton(
    () => InitializerBloc(
      initializerUseCase: it<InitializerUseCase>(),
    ),
  );
}
