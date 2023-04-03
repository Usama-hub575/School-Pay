import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/register_controller.dart';
import 'package:paynest_flutter_app/export.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  UserController userController = Get.put(UserController());
  static GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RegisterController registerController = RegisterController();
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'newPassword');
  // bool isObscure = true;
  // bool cPassword = true;
  // bool completeCode = false;
  // String email = "";
  // String otp = '';

  @override
  void initState() {
    otpController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    // email = args.val('Email').toString();
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
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets().icEyeCrossed,
                                color: colors.primaryColor,
                              ),
                              onPressed: () {
                                context.read<ResetPasswordBloc>().add(
                                      ResetPasswordToggle(),
                                    );
                              },
                            ),
                            readOnly:
                                state.status == ResetPasswordStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: newPasswordController,
                            labelText: password,
                            obscureText: true,
                          ),
                          // TextFormField(
                          //   style: textStyles.bold.copyWith(
                          //     fontSize: sizes.fontRatio * 14,
                          //     color: colors.textGrey,
                          //   ),
                          //   obscureText: isObscure,
                          //   obscuringCharacter: '*',
                          //   controller: newPasswordController,
                          //   decoration: InputDecoration(
                          //     border: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(
                          //           0.5,
                          //         ),
                          //       ),
                          //     ),
                          //     // suffixIcon: IconButton(
                          //     //   icon: SvgPicture.asset(
                          //     //     AppAssets.passwordEye,
                          //     //     color: colors.primaryColor,
                          //     //   ),
                          //     //   onPressed: () {
                          //     //     setState(
                          //     //       () {
                          //     //         isObscure = !isObscure;
                          //     //       },
                          //     //     );
                          //     //   },
                          //     // ),
                          //     focusedBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     labelText: newPassword,
                          //     labelStyle: textStyles.bold.copyWith(
                          //       fontSize: sizes.fontRatio * 12,
                          //       color: colors.primaryColor,
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     errorBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     disabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //   ),
                          //   autovalidateMode:
                          //       AutovalidateMode.onUserInteraction,
                          //   validator: (value) {
                          //     if (value!.trim().isEmpty) {
                          //       return 'Required';
                          //     }
                          //     // Check if the entered email has the right format
                          //     if (value.trim().length < 4) {
                          //       return 'New Password must not be less than 4';
                          //     }
                          //     // Return null if the entered email is valid
                          //     return null;
                          //   },
                          // ),
                          verticalSpacer(16),
                          CommonTextField(
                            icon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets().icEyeCrossed,
                                color: colors.primaryColor,
                              ),
                              onPressed: () {
                                context.read<ResetPasswordBloc>().add(
                                      ResetPasswordToggle(),
                                    );
                              },
                            ),
                            readOnly:
                                state.status == ResetPasswordStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: confirmPasswordController,
                            labelText: password,
                            obscureText: true,
                          ),
                          // TextFormField(
                          //   controller: confirmPasswordController,
                          //   obscureText: cPassword,
                          //   style: textStyles.bold.copyWith(
                          //     fontSize: sizes.fontRatio * 14,
                          //     color: colors.textGrey,
                          //   ),
                          //   obscuringCharacter: '*',
                          //   decoration: InputDecoration(
                          //     border: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(
                          //           0.5,
                          //         ),
                          //       ),
                          //     ),
                          //     // suffixIcon: IconButton(
                          //     //   icon: SvgPicture.asset(
                          //     //     AppAssets.passwordEye,
                          //     //     color: colors.primaryColor,
                          //     //   ),
                          //     //   onPressed: () {
                          //     //     setState(
                          //     //       () {
                          //     //         cPassword = !cPassword;
                          //     //       },
                          //     //     );
                          //     //   },
                          //     // ),
                          //     focusedBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     labelText: confirmPassword,
                          //     labelStyle: textStyles.bold.copyWith(
                          //       fontSize: sizes.fontRatio * 12,
                          //       color: colors.primaryColor,
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     errorBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //     disabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: colors.textGrey.withOpacity(0.5),
                          //       ),
                          //     ),
                          //   ),
                          //   autovalidateMode:
                          //   AutovalidateMode.onUserInteraction,
                          //   validator: (value) {
                          //     if (value!.trim().isEmpty) {
                          //       return 'Required';
                          //     }
                          //     if (value
                          //         .trim()
                          //         .length < 4) {
                          //       return 'Confirm Password must not be less than 4';
                          //     }
                          //     if (value.toString() !=
                          //         newPasswordController.text) {
                          //       return 'password not matched';
                          //     }
                          //     return null;
                          //   },
                          // ),
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
                              length: 5,
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
                              validator: (s) {
                                if (s!.length < 5) {
                                  setState(
                                    () {
                                      state.codeComplete = false;
                                    },
                                  );
                                }
                                return s.isEmpty ? "Enter Code" : '';
                              },
                              keyboardType: TextInputType.phone,
                              showCursor: true,
                              onCompleted: (pin) {
                                state.otp = pin;
                                setState(
                                  () {
                                    state.codeComplete = true;
                                    otpController.text = pin;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpacer(60),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: sizes.heightRatio * 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primaryColor,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (otp.isNotEmpty &&
                                newPasswordController.text.isNotEmpty) {
                              await userController.hitResetPasswordByOTP(
                                email,
                                otp,
                                newPasswordController.text,
                              );
                              if (userController
                                  .forgotPasswordResData.value.status) {
                                CustomAlertDialog.baseDialog(
                                  context: context,
                                  title: "Success!",
                                  message: "Password Updated Successfully",
                                  showCrossIcon: false,
                                  buttonAction: () {
                                    Navigator.popUntil(
                                      context,
                                      ModalRoute.withName('/SignInPage'),
                                    );
                                  },
                                );
                              } else {
                                showToast(
                                    context: context,
                                    message: userController.isFailed.value
                                        .toString(),
                                    color: colors.primaryColor);
                              }
                            } else {
                              showToast(
                                context: context,
                                message: 'Fields can not be empty!',
                                color: colors.primaryColor,
                              );
                            }
                          },
                          child: !userController.isLoading.value
                              ? Text(
                                  "Reset Password",
                                  style: textStyles.bold.copyWith(
                                    color: colors.white,
                                    fontSize: sizes.fontRatio * 16,
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: colors.white,
                                    color: colors.blueAccent,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, listener: (context, state) {
              switch (state.status) {
                case ResetPasswordStatus.init:
                  // TODO: Handle this case.
                  break;
                case ResetPasswordStatus.loading:
                  // TODO: Handle this case.
                  break;
                case ResetPasswordStatus.error:
                  // TODO: Handle this case.
                  break;
                case ResetPasswordStatus.navigateToSignInPage:
                  // TODO: Handle this case.
                  break;
              }
            }),
          ],
        ),
      ),
    );
  }
}
