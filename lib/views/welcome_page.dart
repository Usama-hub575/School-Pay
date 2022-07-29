import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final fcmToken = GetStorage();
  late FirebaseMessaging messaging;
  late FirebaseRemoteConfig remoteConfig;

  @override
  void initState() {
    super.initState();
    remoteConfig = FirebaseRemoteConfig.instance;
    setUpRemoteConfig();
    getFCMToken();
  }

  getFCMToken() async {
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      fcmToken.write('fcmToken', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    print(fcmToken.read('fcmToken'));
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              icBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              paynestLogoNew,
              width: sizes.widthRatio* 230,
            ),
            verticalSpacer(220),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'English',
                    style: PayNestTheme.subtitle16white.copyWith(
                      fontSize: sizes.fontRatio * 18,
                      color: PayNestTheme.colorWhite,
                        fontFamily: 'montserratBold'
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 18.h,
                  color: PayNestTheme.colorWhite,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Arabic',
                    style: PayNestTheme.subtitle16white.copyWith(
                      fontSize: sizes.fontRatio * 18,
                      color: PayNestTheme.dropShadow,
                        fontFamily: 'montserratBold'
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: sizes.heightRatio * 46,
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PayNestTheme.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/SignInPage');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: verticalValue(8),
                  ),
                  child: Text(
                    signIn,
                    style: PayNestTheme.subtitle16white.copyWith(
                      fontSize: 14.sp,
                        fontFamily: 'montserratBold'
                    ),
                  ),
                ),
              ),
            ),
            verticalSpacer(16),
            Container(
              width: double.infinity,
              height: sizes.heightRatio * 46,
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PayNestTheme.colorWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/RegisterPage');
                },
                child: Text(
                  register,
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: 14.sp,
                      fontFamily: 'montserratBold'
                  ),
                ),
              ),
            ),
            verticalSpacer(16),
            GestureDetector(
              onTap: () {
                launch(
                  'https://paynest.ae/privacy-policy.html',
                );
              },
              child: Text(
                privacyPolicy,
                style: PayNestTheme.h2_14textGrey.copyWith(
                  color: PayNestTheme.textGreyWhiteShade,
                  fontSize: sizes.fontRatio * 12,
                    fontFamily: 'montserratBold'
                ),
              ),
            ),
            verticalSpacer(16),
          ],
        ),
      ),
    );
  }

  Future<void> setUpRemoteConfig() async {
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(
          minutes: 1,
        ),
        minimumFetchInterval: const Duration(
          minutes: 30,
        ),
      ),
    );
  }
}


