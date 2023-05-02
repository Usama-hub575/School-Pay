import "package:paynest_flutter_app/export.dart";

bool isLeanEnable = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.initializer,
      debugShowCheckedModeBanner: false,
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
