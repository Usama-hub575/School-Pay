import 'package:get/get.dart';
import 'package:paynest_flutter_app/export.dart';

//flutter build apk --flavor staging -t lib/staging_main.dart

String notificationStudentID = '';
late UserController userController;

Future<void> backgroundHandler(RemoteMessage message) async {
  String payload = message.data['studentId'];
  notificationStudentID = payload;
  print('Handling a background message ${message.messageId}');
  print(message.data.toString());
  print(message.notification!.title.toString());
  flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.notification?.title,
    message.notification?.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: Importance.high,
        priority: Priority.high,
        // other properties...
      ),
    ),
    payload: payload,
  );
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SentryFlutter.init((options) {
    options.dsn = AppConstants.DSN;
    options.environment = AppConstants.sentryEnvironment;
    options.attachScreenshot = true;
  });
  FCM().init();
  initializeLocalNotifications();
  initializeDependencies();
  Future.wait([
    precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        AppAssets().icSchoolBuilding,
      ),
      null,
    ),
  ]);
  // getFCMToken();
  MySharedPreferences.instance;
  userController = Get.put(
    UserController(),
  );
  runZonedGuarded(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: it<FirebaseBloc>()
                ..add(
                  InitializeFirebaseRemoteConfiguration(),
                ),
            ),
            BlocProvider.value(
              value: it<InitializerBloc>(),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    (error, stack) async {
      await Sentry.captureException(
        error,
        stackTrace: stack,
      );
    },
  );
}

void initializeLocalNotifications() async {
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    onMessageOpened(payload);
  });
}

void onMessageOpened(payload) {
  userController.onNotificationTap(
    id: payload,
  );
}

class FCM {
  Future init() async {
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

    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? remoteMessage) {
        if (remoteMessage != null) {
          notificationStudentID = remoteMessage.data['studentId'];
        }
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        notificationStudentID = message.data['studentId'];
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
                priority: Priority.high,
                importance: Importance.high,
                channelDescription: channel.description,
              ),
            ),
            payload: message.data['studentId'],
          );
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage remoteMessage) {
        notificationStudentID = remoteMessage.data['studentId'];
        userController.onNotificationTap(
          id: remoteMessage.data['studentId'],
        );
      },
    );

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
  }
}
