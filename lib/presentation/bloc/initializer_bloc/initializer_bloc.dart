import 'export.dart';

part 'initializer_event.dart';
part 'initializer_state.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  final InitializerUseCase initializerUseCase;
  late StorageRepo storage;

  InitializerBloc({
    required this.initializerUseCase,
  }) : super(InitializerState()) {
    on<UpdateButtonAction>(_updateButtonAction);
    on<GetCountries>(_getCountries);
    on<Initialize>(_initialize);
    // on<Login>(_login);
  }
  late PackageInfo packageInfo;

  _initialize(Initialize event, emit) async {
    String minAppVersion = '';
    String maxAppVersion = '';
    await initializerUseCase.initializeRemoteConfig();
    if (initializerUseCase.getModel() != FirebaseRemoteConfigModel.defaults()) {
      if (Platform.isAndroid) {
        minAppVersion = initializerUseCase.getModel().minAndroidVersion;
        maxAppVersion = initializerUseCase.getModel().maxAndroidVersion;
      }
      if (Platform.isIOS) {
        minAppVersion = initializerUseCase.getModel().minIosVersion;
        maxAppVersion = initializerUseCase.getModel().maxIosVersion;
      }
      if (_isVersionGreaterThan(
          maxAppVersion, initializerUseCase.getModel().currentVersion)) {
        () {
          if (_isVersionGreaterThan(
              minAppVersion, initializerUseCase.getModel().currentVersion)) {
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
        };
      }
    } else {
      emit(
        state.copyWith(
          status: InitializerStatus.welcomePage,
        ),
      );
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
      if (initializerUseCase.getModel().appPackage ==
          AppConstants().googlePlayPackageName) {
        StoreRedirect.redirect(
          androidAppId: initializerUseCase.getModel().appPackage,
        );
      }
    }
  }

  Future _getCountries(GetCountries event, emit) async {
    initializerUseCase.getCountries();
  }

  // _login(Login event, emit) async {
  //   if (storage.getString(key:StorageKeys.email) != null &&
  //       storage.getString(key:StorageKeys.password) != null) {
  //     bool value = await initializerUseCase.login();
  //     if (value) {
  //       emit(
  //         state.copyWith(
  //           status: InitializerStatus.home,
  //         ),
  //       );
  //     } else {
  //       emit(
  //         state.copyWith(
  //           status: InitializerStatus.welcomePage,
  //         ),
  //       );
  //     }
  //   } else {
  //     emit(
  //       state.copyWith(
  //         status: InitializerStatus.welcomePage,
  //       ),
  //     );
  //   }
  // }
}
