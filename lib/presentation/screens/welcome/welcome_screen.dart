import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  VideoPlayerController videoPlayerController = VideoPlayerController.asset(
    AppAssets().welcomeVideo,
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
            videoPlayerController.setLooping(true);
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
                  AppAssets().paynestLogoNew,
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
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 18,
                              color: AppColors().white,
                            ),
                      ),
                    ),
                    Container(
                      width: horizontalValue(2),
                      height: verticalValue(18),
                      color: AppColors().white,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        arabic,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 18,
                              color: AppColors().dropShadow,
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
                    color: AppColors().primaryColor,
                    textColor: AppColors().white,
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
                    color: AppColors().white,
                    textColor: AppColors().primaryColor,
                    isLoading: false,
                    text: register,
                    onPressed: () async {
                      // videoPlayerController.pause();
                      // await Navigator.of(context).pushNamed(navigateToRegister);
                      // videoPlayerController.play();
                    },
                  ),
                ),
                verticalSpacer(16),
                GestureDetector(
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                        EndPoints().getPrivacyPolicyEndPoint(),
                      ),
                    );
                  },
                  child: Text(
                    privacyPolicy,
                    style: TextStyles().bold.copyWith(
                          color: AppColors().textGreyWhiteShade,
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
