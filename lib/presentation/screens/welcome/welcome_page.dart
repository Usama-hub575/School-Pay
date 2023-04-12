import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  VideoPlayerController videoPlayerController = VideoPlayerController.asset(
    assets.welcomeVideo,
  );
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        initializeDateFormatting();
        videoPlayerController.initialize().then(
          (value) {
            videoPlayerController.play();
            videoPlayerController.setVolume(0);
            videoPlayerController.setLooping(
              true,
            );
            setState(() {});
          },
        );
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: videoPlayerController.value.size.width,
                height: videoPlayerController.value.size.height,
                child: VideoPlayer(
                  videoPlayerController,
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizes.height,
            width: sizes.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  assets.payNestLogoNew,
                  width: sizes.widthRatio * 180,
                  fit: BoxFit.fill,
                ),
                verticalSpacer(220),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        english,
                        style: textStyles.bold.copyWith(
                          fontSize: sizes.fontRatio * 18,
                          color: colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: horizontalValue(2),
                      height: verticalValue(18),
                      color: colors.white,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        arabic,
                        style: textStyles.bold.copyWith(
                          fontSize: sizes.fontRatio * 18,
                          color: colors.dropShadow,
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
                  child: ElevatedButtons(
                    color: colors.primaryColor,
                    textColor: colors.white,
                    isLoading: false,
                    text: signIn,
                    onPressed: () async {
                      videoPlayerController.pause();
                      await Navigator.pushNamed(
                        context,
                        AppRoutes.navigateToSignIn,
                      );
                      videoPlayerController.play();
                    },
                  ),
                ),
                verticalSpacer(16),
                Container(
                  width: double.infinity,
                  height: sizes.heightRatio * 46,
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                  ),
                  child: ElevatedButtons(
                    color: colors.white,
                    textColor: colors.primaryColor,
                    isLoading: false,
                    text: register,
                    onPressed: () async {
                      videoPlayerController.pause();
                      await Navigator.pushNamed(
                        context,
                        AppRoutes.navigateToRegister,
                      );
                      videoPlayerController.play();
                    },
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
                    style: textStyles.bold.copyWith(
                      color: colors.textGreyWhiteShade,
                      fontSize: sizes.fontRatio * 12,
                    ),
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
