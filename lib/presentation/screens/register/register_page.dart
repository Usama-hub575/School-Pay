import 'package:paynest_flutter_app/export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterPageViewBloc, RegisterPageViewState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: sizes.height,
            width: sizes.width,
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(25),
            ),
            child: Column(
              children: [
                verticalSpacer(40),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: state.buttonEnable
                          ? null
                          : () {
                              context.read<RegisterPageViewBloc>().add(
                                    BackNavigation(),
                                  );
                            },
                      child: Container(
                        height: sizes.heightRatio * 46,
                        width: sizes.widthRatio * 46,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: colors.black,
                              blurRadius: 1.0,
                              offset: const Offset(
                                1.3, // Move to right 10  horizontally
                                1.3, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          color: colors.primaryColor,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppAssets().welcomeRegisterLogo,
                      width: sizes.widthRatio * 120,
                    ),
                    const Spacer(),
                  ],
                ),
                verticalSpacer(16),
                CustomSlider(
                  currentIndex: state.currentIndex,
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      RegisterMainPage(
                        onButtonTap: (value) => setState(
                          () => state.buttonEnable = value,
                        ),
                        onNextTap: (
                          email,
                          password,
                          phoneCode,
                          phoneNumber,
                        ) {
                          controller.nextPage(
                            duration: const Duration(
                              milliseconds: 1,
                            ),
                            curve: Curves.bounceIn,
                          );
                          context.read<RegisterPageViewBloc>().add(
                                ChangeStep(
                                  currentIndex: 1,
                                ),
                              );
                          state.email = email;
                          state.password = password;
                          state.phoneCode = phoneCode;
                          state.phoneNumber = phoneNumber;
                        },
                      ),
                      RegisterOTPPage(
                        email: state.email,
                        password: state.password,
                        phoneCode: state.phoneCode,
                        phoneNumber: state.phoneNumber,
                        onSuccess: () {
                          controller.nextPage(
                            duration: const Duration(
                              milliseconds: 1,
                            ),
                            curve: Curves.bounceIn,
                          );
                          context.read<RegisterPageViewBloc>().add(
                                ChangeStep(
                                  currentIndex: 2,
                                ),
                              );
                        },
                      ),
                      RegisterDetailPage(
                        phoneCode: state.phoneCode,
                        password: state.password,
                        phoneNumber: state.phoneNumber,
                        email: state.email,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        switch (state.status) {
          case RegisterPageViewStatus.init:
            // TODO: Handle this case.
            break;
          case RegisterPageViewStatus.jumpToMainPage:
            controller.jumpToPage(0);
            break;
          case RegisterPageViewStatus.jumpToPreviousPage:
            controller.previousPage(
              duration: const Duration(milliseconds: 1),
              curve: Curves.bounceIn,
            );
            break;
          case RegisterPageViewStatus.pop:
            Navigator.of(context).pop();
            break;
        }
      },
    );
  }
}
