
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/views/Initilizer.dart';
import 'package:paynest_flutter_app/views/host/forgotpassword/forgot_password.dart';
import 'package:paynest_flutter_app/views/host/forgotpassword/new_password.dart';
import 'package:paynest_flutter_app/views/host/host_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/register_page.dart';
import 'package:paynest_flutter_app/views/signin_page.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';

import 'Utils/sharedpref.dart';

//flutter build apk --flavor staging -t lib/stage_main.dart


late DateFormat dateFormat;

Future<void> backgroundHandler(RemoteMessage message) async {
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


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getFCMToken();
  MySharedPreferences.instance;
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
    description: 'This channel is used for important notifications.',
    // description
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
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
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

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('en_GB');
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, child)=> MaterialApp(
        title: 'PayNest-Staging',
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