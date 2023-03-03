import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynest_flutter_app/presentation/app_routes/app_routes.dart';
import 'package:paynest_flutter_app/presentation/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:paynest_flutter_app/presentation/bloc/initializer_bloc/initializer_bloc.dart';

import 'di/di.dart';
import 'export.dart';

bool isLeanEnable = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppRoutes();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FirebaseBloc(
            firebaseUseCase: it(),
          )..add(
              InitializeFirebaseRemoteConfiguration(),
            ),
        ),
        BlocProvider(
          create: (_) => InitializerBloc(
            initializerUseCase: it(),
            firebaseUseCase: it(),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.initializer,
      ),
    );
  }
}

// getFCMToken() async {
//   var messaging = FirebaseMessaging.instance;
//   final fcmToken = GetStorage();
//   messaging.getToken().then((value) {
//     fcmToken.write('fcmToken', value);
//     print(fcmToken.read('fcmToken'));
//   });
// }
