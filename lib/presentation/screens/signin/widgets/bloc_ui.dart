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
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
                      style: TextStyles().bold.copyWith(
                            color: AppColors().black,
                            fontSize: sizes.fontRatio * 22,
                          ),
                    ),
                    verticalSpacer(16),
                    Text(
                      pleaseEnterYourRegisteredEmailIdAndPassword,
                      style: TextStyles().medium.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: AppColors().black,
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
                          AppAssets().icEyeCrossed,
                          color: PayNestTheme.primaryColor,
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
                  context.read<SignInBloc>().add(
                        ForgotPassword(),
                      );
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    forgotPassword,
                    style: TextStyles().bold.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: AppColors().primaryColor,
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
                                AppAssets().faceId,
                                height: 109,
                                width: 81,
                                repeat: true,
                              ),
                              SizedBox(
                                child: Text(
                                  loginWithTouchID,
                                  style: TextStyles().bold.copyWith(
                                        fontSize: sizes.fontRatio * 18,
                                        color: AppColors().black,
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
                  color: AppColors().primaryColor,
                  text: signIn,
                  isLoading:
                      state.status == SignInStatus.loading ? true : false,
                  textColor: AppColors().white,
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
                      color: AppColors().primaryColor,
                    ),
                  ),
                  horizontalSpacer(10),
                  Text(
                    or,
                    style: TextStyles().bold.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: AppColors().black,
                        ),
                  ),
                  horizontalSpacer(10),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: AppColors().primaryColor,
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),
              ContinueButton(
                text: google,
                icon: Image.asset(
                  AppAssets().icGoogle,
                ),
              ),
              verticalSpacer(16),
              ContinueButton(
                text: facebook,
                icon: Image.asset(
                  AppAssets().icFacebook,
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        switch (state.status) {
          case SignInStatus.forgotPassword:
            //GoRouter.of(context).push(forgotPassword);
            break;
          case SignInStatus.home:
            //GoRouter.of(context).push(dashBoard);
            break;
          case SignInStatus.showToast:
            showToast(
              message: state.message,
              context: context,
              color: AppColors().redShade2,
            );
            break;
          case SignInStatus.init:
            // TODO: Handle this case.
            break;
          case SignInStatus.loading:
            // TODO: Handle this case.
            break;
          case SignInStatus.loaded:
            // TODO: Handle this case.
            break;
          case SignInStatus.toggle:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}
