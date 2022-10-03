import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/views/Initilizer.dart';
import 'package:paynest_flutter_app/views/host/forgotpassword/forgot_password.dart';
import 'package:paynest_flutter_app/views/host/forgotpassword/new_password.dart';
import 'package:paynest_flutter_app/views/host/host_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/register_page.dart';
import 'package:paynest_flutter_app/views/signin_page.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';
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
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (routes) {
          Widget page = InitializerScreen();
          switch (routes.name) {
            case '/':
              page = InitializerScreen();
              break;
            case '/Welcome':
              break;case '/Welcome':
            page = WelcomePage();
            break;
            case '/SignInPage':
              page = SignInPage();
              break;
            case '/ForgotPassword':
              page = ForgotPassword();
              break;
            case '/NewPassword':
              final args = routes.arguments;
              page = NewPassword(
                email: args as String,
              );
              break;
            case '/RegisterPage':
              page = RegisterPage();
              break;
            case '/DashboardPage':
              page = HostPage();
              break;
          }
          return PageRouteBuilder(
            settings: routes,
            pageBuilder: (_, __, ___) => page,
          );
        },
      ),
    );
  }
}

getFCMToken() async {
  var messaging = FirebaseMessaging.instance;
  final fcmToken = GetStorage();
  messaging.getToken().then((value) {
    fcmToken.write('fcmToken', value);
    print(fcmToken.read('fcmToken'));
  });
}