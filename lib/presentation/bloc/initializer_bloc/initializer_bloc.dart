import 'package:paynest_flutter_app/export.dart';

part 'initializer_event.dart';
part 'initializer_state.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  final FirebaseUseCase firebaseUseCase;
  final InitializerUseCase initializerUseCase;

  InitializerBloc({
    required this.firebaseUseCase,
    required this.initializerUseCase,
  }) : super(InitializerState()) {
    on<UpdateButtonAction>(_updateButtonAction);
    on<GetCountries>(_getCountries);
    on<Initialize>(_initialize);
    on<Login>(_login);
  }

  late PackageInfo packageInfo;

  _initialize(Initialize event, emit) async {
    String minAppVersion = '';
    String maxAppVersion = '';
    await firebaseUseCase.initializeRemoteConfig();
    if (firebaseUseCase.getModel() != FirebaseRemoteConfigModel.defaults()) {
      if (Platform.isAndroid) {
        minAppVersion = firebaseUseCase.getModel().minAndroidVersion;
        maxAppVersion = firebaseUseCase.getModel().maxAndroidVersion;
      }
      if (Platform.isIOS) {
        minAppVersion = firebaseUseCase.getModel().minIosVersion;
        maxAppVersion = firebaseUseCase.getModel().maxIosVersion;
      }
      if (_isVersionGreaterThan(
          maxAppVersion, firebaseUseCase.getModel().currentVersion)) {
        if (_isVersionGreaterThan(
            minAppVersion, firebaseUseCase.getModel().currentVersion)) {
          emit(
            state.copyWith(
              status: InitializerStatus.forcefulDialogue,
              showCancelButton: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: InitializerStatus.optionalDialogue,
              showCancelButton: true,
            ),
          );
        }
      } else {
        add(
          Login(),
        );
      }
    }
  }

  bool _isVersionGreaterThan(String firebaseVersion, String appVersion) {
    List<String> currentVersion = appVersion.split(".");
    List<String> newVersion = firebaseVersion.split(".");
    bool a = false;
    for (var i = 0; i <= 2; i++) {
      a = int.parse(newVersion[i]) > int.parse(currentVersion[i]);
      if (int.parse(newVersion[i]) != int.parse(currentVersion[i])) break;
    }
    return a;
  }

  _updateButtonAction(UpdateButtonAction event, emit) {
    if (Platform.isIOS) {
      StoreRedirect.redirect(iOSAppId: AppConstants().iosAppId);
    } else if (Platform.isAndroid) {
      if (firebaseUseCase.getModel().appPackage ==
          AppConstants().googlePlayPackageName) {
        StoreRedirect.redirect(
          androidAppId: firebaseUseCase.getModel().appPackage,
        );
      }
    }
  }

  Future _getCountries(GetCountries event, emit) async {
    await initializerUseCase.getCountries();
  }

  _login(Login event, emit) async {
    if (initializerUseCase.getString(key: StorageKeys.email) != null &&
        initializerUseCase.getString(key: StorageKeys.password) != null) {
      final response = await initializerUseCase.login();
      response.fold(
        (success) {
          emit(
            state.copyWith(
              status: InitializerStatus.dashboardPage,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              status: InitializerStatus.welcomePage,
            ),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          status: InitializerStatus.welcomePage,
        ),
      );
    }
  }
}
