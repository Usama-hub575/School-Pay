import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/model/datamodel/reg1_to_otp.dart';
import 'package:paynest_flutter_app/views/details_page.dart';
import 'package:paynest_flutter_app/views/host/host_page.dart';
import 'package:paynest_flutter_app/views/otp_page.dart';
import 'package:paynest_flutter_app/views/reg_pin_page.dart';
import 'package:paynest_flutter_app/views/register_page.dart';
import 'package:paynest_flutter_app/views/signin_page.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';

Future<void> backgroundHandler(RemoteMessage message) async{
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data.toString());
  print(message.notification!.title.toString());
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getFCMToken();

  FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            // channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ),
      );
    }
  });

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);


    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      sound: true,
    );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375,812),
        builder:() => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          onGenerateRoute: (routes){
            Widget page = WelcomePage();
            switch(routes.name){
              case '/':
                page = WelcomePage();
                break;
              case '/SignInPage':
                page = SignInPage();
                break;
              case '/RegisterPage':
                page = RegisterPage();
                break;
              case '/OTPPage':
                Reg1toOtp data = routes.arguments as Reg1toOtp;
                page = OTPPage(
                  email: data.email,
                  password: data.password,
                  phoneCode: data.phoneCode,
                  phoneNumber: data.phoneNumber,
                );
                break;
              case '/DetailsPage':
                Reg1toOtp data = routes.arguments as Reg1toOtp;
                page = DetailsPage(
                  email: data.email,
                  password: data.password,
                  phoneCode: data.phoneCode,
                  phoneNumber: data.phoneNumber,
                );
                break;
              case '/CreatePin':
                page = CreatePin();
                break;
              case '/DashboardPage':
                page = HostPage();
                break;
            }
            return PageRouteBuilder(
                settings: routes,
                pageBuilder: (_, __, ___) => page
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
