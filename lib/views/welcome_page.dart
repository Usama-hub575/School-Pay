import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/sharedpref.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../presentation/res/res.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final fcmToken = GetStorage();
  late FirebaseMessaging messaging;
  MySharedPreferences storage = MySharedPreferences.instance;
  late VideoPlayerController videoPlayerController;
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('en_GB');
    getFCMToken();
    videoPlayerController =
        VideoPlayerController.asset(AppAssets().welcomeVideo);
    videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setVolume(0);
      videoPlayerController.setLooping(true);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
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
      body: Stack(
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
            height: sizes.height,
            width: sizes.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  AppAssets().paynestLogoNew,
                  width: sizes.widthRatio * 230,
                ),
                verticalSpacer(220),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'English',
                //         style: PayNestTheme.subtitle16white.copyWith(
                //           fontSize: sizes.fontRatio * 18,
                //           color: PayNestTheme.colorWhite,
                //             fontFamily: 'montserratBold'
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 2,
                //       height: 18.h,
                //       color: PayNestTheme.colorWhite,
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Arabic',
                //         style: PayNestTheme.subtitle16white.copyWith(
                //           fontSize: sizes.fontRatio * 18,
                //           color: PayNestTheme.dropShadow,
                //             fontFamily: 'montserratBold'
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Container(
                  width: double.infinity,
                  height: sizes.heightRatio * 46,
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PayNestTheme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      videoPlayerController.pause();
                      await Navigator.pushNamed(context, '/SignInPage');
                      videoPlayerController.play();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(8),
                      ),
                      child: Text(
                        signIn,
                        style: PayNestTheme.subtitle16white.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          fontFamily: 'montserratBold',
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
                      backgroundColor: PayNestTheme.colorWhite,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      storage.myPrefs!.remove('accessToken');
                      storage.myPrefs!.remove('email');
                      storage.myPrefs!.clear();
                      videoPlayerController.pause();
                      await Navigator.pushNamed(context, '/RegisterPage');
                      videoPlayerController.play();
                    },
                    child: Text(
                      register,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          fontFamily: 'montserratBold'),
                    ),
                  ),
                ),
                verticalSpacer(16),
                GestureDetector(
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://paynest.ae/privacy-policy.html'),
                    );
                  },
                  child: Text(
                    privacyPolicy,
                    style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.textGreyWhiteShade,
                        fontSize: sizes.fontRatio * 12,
                        fontFamily: 'montserratBold'),
                  ),
                ),
                verticalSpacer(16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
