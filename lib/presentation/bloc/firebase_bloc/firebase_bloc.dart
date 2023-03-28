import 'package:paynest_flutter_app/export.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc({
    required this.firebaseUseCase,
  }) : super(FirebaseState()) {
    on<InitializeFirebaseRemoteConfiguration>(_initializeFirebaseRemoteConfig);
  }

  final FirebaseUseCase firebaseUseCase;

  Future<void> _initializeFirebaseRemoteConfig(
    InitializeFirebaseRemoteConfiguration event,
    emit,
  ) async {
    bool value = await firebaseUseCase.initializeRemoteConfig();
    if (value) {
      emit(
        state.copyWith(
          status: FirebaseStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FirebaseStatus.failure,
        ),
      );
    }
    var messaging = FirebaseMessaging.instance;
    final fcmToken = StorageRepoImpl(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
    messaging.getToken().then(
      (value) {
        fcmToken.saveString(
          key: 'fcmToken',
          value: value,
        );
        if (kDebugMode) {
          print(
            fcmToken.getString(
              key: 'fcmToken',
            ),
          );
        }
      },
    );
  }
}
