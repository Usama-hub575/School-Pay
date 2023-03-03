import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/presentation/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/presentation/res/colors.dart';
import 'package:paynest_flutter_app/presentation/res/res.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/custom_alert_dialog.dart';
import '../../bloc/initializer_bloc/initializer_bloc.dart';
import '../../bloc/initializer_bloc/initializer_status.dart';
import 'export.dart';

class InitializerPage extends StatefulWidget {
  const InitializerPage({Key? key}) : super(key: key);

  @override
  State<InitializerPage> createState() => _InitializerPageState();
}

class _InitializerPageState extends State<InitializerPage> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(AppAssets().welcomeVideo);

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
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
    super.initState();
    context.read<FirebaseBloc>().add(
          InitializeFirebaseRemoteConfiguration(),
        );
    context.read<InitializerBloc>().add(
          GetCountries(),
        );
    context.read<InitializerBloc>().add(
          Initialize(),
        );
    context.read<InitializerBloc>().add(
          Login(),
        );
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: BlocConsumer<InitializerBloc, InitializerState>(
        builder: (context, state) {
          return Stack(
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
                width: sizes.width,
                height: sizes.height,
                child: Container(
                  color: AppColors().primaryColor.withOpacity(0.30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets().paynestLogoNew,
                          width: sizes.widthRatio * 180,
                          fit: BoxFit.fill,
                        ),
                        verticalSpacer(16),
                        SizedBox(
                          width: sizes.width / 2,
                          child: LinearProgressIndicator(
                            color: AppColors().white,
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
        listener: (context, state) {
          switch (state.status) {
            case InitializerStatus.optionalDialogue:
              CustomAlertDialog.appUpdateDialog(
                context: context,
                title: updateAvailable,
                message: goToStore,
                showCrossIcon: false,
                showCancelButton: state.showCancelButton,
                updateButtonAction: () {
                  context.read<InitializerBloc>().add(
                        UpdateButtonAction(),
                      );
                },
                cancelButtonAction: () {
                  // Navigator.of(context).push(navigateToWelcome);
                },
                locale: state.languageIndex,
              );
              break;
            case InitializerStatus.forcefulDialogue:
              CustomAlertDialog.appUpdateDialog(
                context: context,
                title: update,
                message:
                    forMoreFeaturesAndBetterUserExperienceYouNeedToUpdateThisApp,
                showCrossIcon: false,
                showCancelButton: state.showCancelButton,
                updateButtonAction: () {
                  context.read<InitializerBloc>().add(
                        UpdateButtonAction(),
                      );
                },
                locale: state.languageIndex,
              );
              break;
            case InitializerStatus.home:
              // Navigator.of(context).push(navigateToWelcome);
              break;
            case InitializerStatus.welcomePage:
              // Navigator.of(context).push(navigateToWelcome);
              break;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
