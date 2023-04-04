import 'package:paynest_flutter_app/export.dart';

class NewPassword extends StatefulWidget {
  final String email;

  const NewPassword({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  static GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'newPassword');

  @override
  void initState() {
    otpController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                AppBarBackButton(
                  buttonColor: colors.primaryColor,
                  iconColor: colors.white,
                ),
                const Spacer(),
                Image.asset(
                  AppAssets().welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                const Spacer(),
              ],
            ),
            BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Form(
                        key: newPasswordKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacer(80),
                            Text(
                              newPassword,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 20,
                                color: colors.primaryColor,
                              ),
                            ),
                            verticalSpacer(16),
                            CommonTextField(
                              validatorText: pleaseEnterPassword,
                              icon: IconButton(
                                icon: SvgPicture.asset(
                                  AppAssets().icEyeCrossed,
                                  color: colors.primaryColor,
                                ),
                                onPressed: () {
                                  context.read<ResetPasswordBloc>().add(
                                        ResetPasswordToggle(
                                          value: 'newPassword',
                                        ),
                                      );
                                },
                              ),
                              readOnly:
                                  state.status == ResetPasswordStatus.loading
                                      ? true
                                      : false,
                              onValidate: (value) {
                                return null;
                              },
                              controller: newPasswordController,
                              labelText: newPassword,
                              obscureText: state.newPasswordObscure,
                            ),
                            verticalSpacer(16),
                            CommonTextField(
                              validatorText: pleaseEnterPassword,
                              icon: IconButton(
                                icon: SvgPicture.asset(
                                  AppAssets().icEyeCrossed,
                                  color: colors.primaryColor,
                                ),
                                onPressed: () {
                                  context.read<ResetPasswordBloc>().add(
                                        ResetPasswordToggle(
                                          value: 'confirmPassword',
                                        ),
                                      );
                                },
                              ),
                              readOnly:
                                  state.status == ResetPasswordStatus.loading
                                      ? true
                                      : false,
                              onValidate: (value) {
                                if (newPasswordController.text !=
                                    confirmPasswordController.text) {
                                  return passwordNotMatched;
                                } else {
                                  return null;
                                }
                              },
                              controller: confirmPasswordController,
                              labelText: confirmPassword,
                              obscureText: state.confirmPasswordObscure,
                            ),
                            verticalSpacer(16),
                            Text(
                              otp,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: colors.primaryColor,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              child: Pinput(
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                length: 5,
                                errorTextStyle: TextStyles().bold.copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: AppColors().redShade2,
                                    ),
                                defaultPinTheme: PinTheme(
                                  textStyle: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 16,
                                    color: colors.black,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  width: sizes.widthRatio * 80,
                                  height: sizes.heightRatio * 50,
                                ),
                                controller: otpController,
                                validator: (value) {
                                  if (value!.length < 5) {
                                    context.read<ResetPasswordBloc>().add(
                                          IsCodeComplete(
                                            isCodeComplete: false,
                                            pin: '',
                                          ),
                                        );
                                  }
                                  return value.isEmpty ? "Enter Code" : null;
                                },
                                keyboardType: TextInputType.phone,
                                showCursor: true,
                                onCompleted: (pin) {
                                  context.read<ResetPasswordBloc>().add(
                                        IsCodeComplete(
                                          isCodeComplete: true,
                                          pin: pin,
                                        ),
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(60),
                      SizedBox(
                        width: double.infinity,
                        height: sizes.heightRatio * 46,
                        child: ElevatedButtons(
                          color: colors.primaryColor,
                          textColor: colors.white,
                          text: resetPassword,
                          isLoading: state.status == ResetPasswordStatus.loading
                              ? true
                              : false,
                          onPressed: () async {
                            if (newPasswordKey.currentState!.validate() &&
                                state.otp.isNotEmpty &&
                                newPasswordController.text.isNotEmpty) {
                              context.read<ResetPasswordBloc>().add(
                                    ResetPasswordLoading(),
                                  );
                              context.read<ResetPasswordBloc>().add(
                                    ResetPassword(
                                      email: widget.email,
                                      otp: otpController.text,
                                      password: newPasswordController.text,
                                    ),
                                  );
                            } else {
                              showToast(
                                context: context,
                                message: fieldsCannotBeEmpty,
                                color: colors.primaryColor,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                switch (state.status) {
                  case ResetPasswordStatus.init:
                    // TODO: Handle this case.
                    break;
                  case ResetPasswordStatus.loading:
                    // TODO: Handle this case.
                    break;
                  case ResetPasswordStatus.error:
                    showToast(
                      context: context,
                      message: state.errorMessage,
                      color: colors.primaryColor,
                    );
                    break;
                  case ResetPasswordStatus.success:
                    CustomAlertDialog.baseDialog(
                      context: context,
                      title: "Success!",
                      message: "Password Updated Successfully",
                      showCrossIcon: false,
                      buttonAction: () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.navigateToSignIn,
                          ModalRoute.withName(
                            AppRoutes.navigateToNewPassword,
                          ),
                        );
                      },
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
