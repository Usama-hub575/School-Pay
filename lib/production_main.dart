import 'export.dart';

//flutter build apk --flavor production -t lib/production_main.dart

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
