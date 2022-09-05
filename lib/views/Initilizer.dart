import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynest_flutter_app/res/constants.dart';
import 'package:paynest_flutter_app/service/api_service.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';

import '../Utils/sharedPrefKeys.dart';
import '../Utils/sharedpref.dart';
import '../constants/constants.dart';
import '../res/res.dart';
import '../widgets/custom_alert_dialog.dart';
import 'package:video_player/video_player.dart';

class InitializerScreen extends StatefulWidget {
  const InitializerScreen({Key? key}) : super(key: key);

  @override
  State<InitializerScreen> createState() => _InitializerScreenState();
}

class _InitializerScreenState extends State<InitializerScreen> {
  MySharedPreferences storage = MySharedPreferences.instance;
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  String minAppVersion = '';
  String maxAppVersion = '';
  late PackageInfo packageInfo;
  String localAppVersion = '';
  String appPackage = '';
  int languageIndex = 0;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    getLocalPackageInfo();
    setUpRemoteConfig();
    // getCountries();
    videoPlayerController = VideoPlayerController.asset(welcomeVideo);
    videoPlayerController.initialize().then((value){
      videoPlayerController.play();
      videoPlayerController.setVolume(0);
      videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: PayNestTheme.primaryColor,
      body:Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                width: videoPlayerController.value.size.width,
                height: videoPlayerController.value.size.height,
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          ),
          Container(
            width: sizes.width,
            height: sizes.height,
            child: Container(
              color: PayNestTheme.primaryColor.withOpacity(0.30),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      paynestLogoNew,
                      width: sizes.widthRatio * 180,
                      fit: BoxFit.fill,
                    ),
                    verticalSpacer(16),
                    SizedBox(
                      width: sizes.width / 2,
                      child: LinearProgressIndicator(
                        color: PayNestTheme.colorWhite,
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getOptionalAppUpdateDialog() {
    CustomAlertDialog.optionalAppUpdateDialog(
        context: context,
        title: "Update Available",
        message: "Go to store",
        showCrossIcon: false,
        updateButtonAction: () {
          if (Platform.isIOS) {
            setState(() {
              StoreRedirect.redirect(iOSAppId: iosAppId);
            });
          } else if (Platform.isAndroid) {
            if (appPackage == huaweiPackageName) {
              setState(() {
                StoreRedirect.redirect(
                  androidAppId: appPackage,
                );
              });
            } else if (appPackage == googlePlayPackageName) {
              setState(() {
                StoreRedirect.redirect(
                  androidAppId: appPackage,
                );
              });
            }
          }
        },
        cancelButtonAction: () {
          setState(() {
            getCountries();
          });
        },
        locale: languageIndex);
  }

  void getForcefulAppUpdateDialog() {
    CustomAlertDialog.forcefulAppUpdateDialog(
        context: context,
        title: "Update!",
        message:
            "For More Features And Better User Experience, You Need To Update This App",
        showCrossIcon: false,
        updateButtonAction: () {
          if (Platform.isIOS) {
            setState(() {
              StoreRedirect.redirect(iOSAppId: iosAppId);
            });
          } else if (Platform.isAndroid) {
            if (appPackage == huaweiPackageName) {
              setState(() {
                StoreRedirect.redirect(
                  androidAppId: appPackage,
                );
              });
            } else if (appPackage == googlePlayPackageName) {
              setState(() {
                StoreRedirect.redirect(
                  androidAppId: appPackage,
                );
              });
            }
          }
        },
        locale: languageIndex);
  }

  Future<void> getCountries() async {
    try {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          videoPlayerController.pause();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
          );
        },
      );
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  Future<void> getLocalPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    localAppVersion = packageInfo.version;
    appPackage = packageInfo.packageName;
  }

  bool isVersionGreaterThan(String newVersion, String currentVersion) {
    List<String> currentV = currentVersion.split(".");
    List<String> newV = newVersion.split(".");
    bool a = false;
    for (var i = 0; i <= 2; i++) {
      a = int.parse(newV[i]) > int.parse(currentV[i]);
      if (int.parse(newV[i]) != int.parse(currentV[i])) break;
    }
    return a;
  }

  Future<void> setUpRemoteConfig() async {
    remoteConfig.setDefaults(<String, String>{
      baseUrl: 'https://stage-api.paynestschools.ae',
      paymentGatewayUrl: 'https://staging.paynestschools.ae/pl',
      maxAndroidAppVersion: '2.0.0',
      minAndroidAppVersion: '1.0.0',
      maxIosAppVersion: '2.0.0',
      minIosAppVersion: '1.0.0',
    });
    await remoteConfig.ensureInitialized();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(
          minutes: 1,
        ),
        minimumFetchInterval: const Duration(
          seconds: 1,
        ),
      ),
    );
    try{
      await remoteConfig.fetchAndActivate();
      // APIService.baseUrl = Uri.parse(remoteConfig.getString(baseUrl));
      // APIService.paymentGatewayUrl =
      //     Uri.parse(remoteConfig.getString(paymentGatewayUrl));
      minAndroidAppVersion = remoteConfig.getString(minAndroidAppVersion);
      maxAndroidAppVersion = remoteConfig.getString(maxAndroidAppVersion);
      minIosAppVersion = remoteConfig.getString(minIosAppVersion);
      maxIosAppVersion = remoteConfig.getString(maxIosAppVersion);

      if (Platform.isAndroid) {
        minAppVersion = minAndroidAppVersion;
        maxAppVersion = maxAndroidAppVersion;
      }
      if (Platform.isIOS) {
        minAppVersion = minIosAppVersion;
        maxAppVersion = maxIosAppVersion;
      }

      isVersionGreaterThan(maxAppVersion, localAppVersion) == true
          ? Future.delayed(const Duration(seconds: 1)).then(
            (value) =>
        isVersionGreaterThan(minAppVersion, localAppVersion) == true
            ? getForcefulAppUpdateDialog()
            : getOptionalAppUpdateDialog(),
      )
          : Future.delayed(const Duration(seconds: 2))
          .then((value) => getCountries());
    }catch(e){
      getCountries();
    }
  }
}
