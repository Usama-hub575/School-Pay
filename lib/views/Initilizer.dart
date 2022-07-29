import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

  @override
  void initState() {
    getLocalPackageInfo();
    setUpRemoteConfig();
    //getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: PayNestTheme.primaryColor,
      body: Container(
        width: sizes.width,
        height: sizes.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(icBackground),
              fit: BoxFit.fill),
        ),
        child: Container(
          color: PayNestTheme.primaryColor.withOpacity(0.30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  paynestLogoNew,
                  width: sizes.widthRatio* 180,
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
        locale: languageIndex);
  }

  Future<void> getCountries() async {
    try {
        Future.delayed(
          const Duration(seconds: 2),
          () {
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
    await remoteConfig.ensureInitialized();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(
          minutes: 1,
        ),
        minimumFetchInterval: const Duration(
          seconds: 30,
        ),
      ),
    );
    await remoteConfig.fetchAndActivate();

    if (Platform.isAndroid) {
      minAppVersion = remoteConfig.getString(minAndroidAppVersion);
      maxAppVersion = remoteConfig.getString(maxAndroidAppVersion);
    }
    if (Platform.isIOS) {
      minAppVersion = remoteConfig.getString(minIosAppVersion);
      maxAppVersion = remoteConfig.getString(maxIosAppVersion);
    }

    isVersionGreaterThan(maxAppVersion, localAppVersion) == true
        ? Future.delayed(const Duration(seconds: 2)).then((value) =>
            isVersionGreaterThan(minAppVersion, localAppVersion) == true
                ? getForcefulAppUpdateDialog()
                : getOptionalAppUpdateDialog())
        : Future.delayed(const Duration(seconds: 2))
            .then((value) => getCountries());
  }
}
