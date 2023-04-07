import 'package:paynest_flutter_app/export.dart';

class BlocUI extends StatefulWidget {
  const BlocUI({Key? key}) : super(key: key);

  @override
  State<BlocUI> createState() => _BlocUIState();
}

class _BlocUIState extends State<BlocUI> {
  final userResponseData = AuthenticationModel.empty();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      builder: (context, state) {
        return Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(16),
                    Text(
                      signIn,
                      style: textStyles.bold.copyWith(
                        color: colors.black,
                        fontSize: sizes.fontRatio * 22,
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      pleaseEnterYourRegisteredEmailIdAndPassword,
                      style: textStyles.medium.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: colors.black,
                      ),
                    ),
                    verticalSpacer(34),
                    CommonTextField(
                      readOnly:
                          state.status == SignInStatus.loading ? true : false,
                      onValidate: (value) {},
                      controller: emailController,
                      labelText: email,
                      validatorText: pleaseEnterEmail,
                      obscureText: false,
                    ),
                    verticalSpacer(16),
                    CommonTextField(
                      readOnly:
                          state.status == SignInStatus.loading ? true : false,
                      onValidate: (value) {},
                      controller: passwordController,
                      obscureText: state.isObscure,
                      labelText: password,
                      validatorText: pleaseEnterPassword,
                      icon: IconButton(
                        icon: SvgPicture.asset(
                          assets.icEyeCrossed,
                          color: colors.primaryColor,
                        ),
                        onPressed: () {
                          context.read<SignInBloc>().add(
                                SignInToggle(),
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(16),
              InkWellWidget(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.navigateToForgotPassword,
                  );
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    forgotPassword,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      color: colors.primaryColor,
                    ),
                  ),
                ),
              ),
              state.isBioMetric
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.52),
                        child: InkWellWidget(
                          onTap: () async {
                            context.read<SignInBloc>().add(
                                  Loading(),
                                );
                            context.read<SignInBloc>().add(
                                  BioMetric(),
                                );
                          },
                          child: Column(
                            children: [
                              Lottie.asset(
                                assets.faceId,
                                height: 109,
                                width: 81,
                                repeat: true,
                              ),
                              SizedBox(
                                child: Text(
                                  loginWithTouchID,
                                  style: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 18,
                                    color: colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              verticalSpacer(60),
              SizedBox(
                width: double.infinity,
                height: sizes.heightRatio * 46,
                child: ElevatedButtons(
                  color: colors.primaryColor,
                  text: signIn,
                  isLoading:
                      state.status == SignInStatus.loading ? true : false,
                  textColor: colors.white,
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      context.read<SignInBloc>().add(
                            Loading(),
                          );
                      context.read<SignInBloc>().add(
                            OnPressed(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                ),
              ),
              verticalSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: colors.primaryColor,
                    ),
                  ),
                  horizontalSpacer(10),
                  Text(
                    or,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      color: colors.black,
                    ),
                  ),
                  horizontalSpacer(10),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: colors.primaryColor,
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),
              ContinueButton(
                text: google,
                icon: Image.asset(
                  assets.icGoogle,
                ),
              ),
              verticalSpacer(16),
              ContinueButton(
                text: facebook,
                icon: Image.asset(
                  assets.icFacebook,
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        switch (state.status) {
          case SignInStatus.forgotPassword:
            // Navigator.pushNamed(
            //   context,
            //   AppRoutes.navigateToForgotPassword,
            // );
            break;
          case SignInStatus.home:
            Navigator.pushNamed(
              context,
              AppRoutes.navigateToDashboard,
            );
            break;
          case SignInStatus.showToast:
            showToast(
              message: state.message,
              context: context,
              color: colors.redShade2,
            );
            break;
          case SignInStatus.init:
            break;
          case SignInStatus.loading:
            break;
          case SignInStatus.loaded:
            break;
          case SignInStatus.toggle:
            break;
        }
      },
    );
  }
}
