import 'package:paynest_flutter_app/export.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  static GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: verticalValue(129),
            decoration: BoxDecoration(
              color: colors.primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: horizontalValue(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        AppBarBackButton(
                          iconColor: colors.primaryColor,
                          buttonColor: colors.white,
                        ),
                        horizontalSpacer(25),
                        Text(
                          changePassword,
                          style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 20,
                            color: colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
            builder: (context, state) {
              return Form(
                key: changePasswordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: verticalValue(16),
                    horizontal: horizontalValue(16),
                  ),
                  child: Column(
                    children: [
                      CommonTextField(
                        readOnly: state.status == ChangePasswordStatus.loading
                            ? true
                            : false,
                        onValidate: (value) {},
                        controller: oldPasswordController,
                        labelText: oldPassword,
                        validatorText: pleaseEnterPassword,
                        obscureText: state.oldPasswordObscure,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            assets.icEyeCrossed,
                            color: colors.primaryColor,
                          ),
                          onPressed: () {
                            context.read<ChangePasswordBloc>().add(
                                  ChangePasswordToggle(
                                    value: "OldPassword",
                                  ),
                                );
                          },
                        ),
                      ),
                      verticalSpacer(12),
                      CommonTextField(
                        readOnly: state.status == ChangePasswordStatus.loading
                            ? true
                            : false,
                        onValidate: (value) {},
                        controller: newPasswordController,
                        validatorText: pleaseCreatePassword,
                        labelText: newPassword,
                        obscureText: state.newPasswordObscure,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            assets.icEyeCrossed,
                            color: colors.primaryColor,
                          ),
                          onPressed: () {
                            context.read<ChangePasswordBloc>().add(
                                  ChangePasswordToggle(
                                    value: "NewPassword",
                                  ),
                                );
                          },
                        ),
                      ),
                      verticalSpacer(12),
                      CommonTextField(
                        readOnly: state.status == ChangePasswordStatus.loading
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
                        validatorText: pleaseConfirmPassword,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            assets.icEyeCrossed,
                            color: colors.primaryColor,
                          ),
                          onPressed: () {
                            context.read<ChangePasswordBloc>().add(
                                  ChangePasswordToggle(
                                    value: "ConfirmPassword",
                                  ),
                                );
                          },
                        ),
                        obscureText: state.confirmPasswordObscure,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: sizes.heightRatio * 46,
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
                child: ElevatedButtons(
                  color: colors.primaryColor,
                  isLoading: state.status == ChangePasswordStatus.loading
                      ? true
                      : false,
                  text: changePassword,
                  textColor: colors.white,
                  onPressed: () async {
                    if (changePasswordFormKey.currentState!.validate()) {
                      context.read<ChangePasswordBloc>().add(
                            ChangePasswordLoading(),
                          );
                      context.read<ChangePasswordBloc>().add(
                            ChangePasswordOnPressed(
                              oldPassword: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                            ),
                          );
                    }
                  },
                ),
              );
            },
            listener: (context, state) {
              switch (state.status) {
                case ChangePasswordStatus.init:
                  break;
                case ChangePasswordStatus.loading:
                  break;
                case ChangePasswordStatus.success:
                  showToast(
                    message: passwordResetSuccessfully,
                    context: context,
                    color: colors.primaryColor,
                  );
                  oldPasswordController.clear();
                  newPasswordController.clear();
                  confirmPasswordController.clear();
                  Navigator.pop(context);
                  break;
                case ChangePasswordStatus.error:
                  showToast(
                    message: state.errorMessage,
                    context: context,
                    color: colors.redShade2,
                  );
                  break;
              }
            },
          ),
          verticalSpacer(16),
        ],
      ),
    );
  }
}
