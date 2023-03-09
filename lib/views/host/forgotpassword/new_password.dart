import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/register_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/constants.dart';
import '../../../controller/user_controller.dart';
import '../../../presentation/res/res.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/spacer.dart';
import '../../../widgets/toast.dart';

class NewPassword extends StatefulWidget {
  NewPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  UserController userController = Get.put(UserController());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RegisterController registerController = RegisterController();
  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'newPassword');
  bool isObscure = true;
  bool cPassword = true;
  bool completeCode = false;
  String email = "";
  String otp = '';

  @override
  void initState() {
    email = widget.email;
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
                Container(
                  height: 54.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2.0,
                        offset: Offset(
                          3.0, // Move to right 10  horizontally
                          3.0, // Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                    color: PayNestTheme.primaryColor,
                    borderRadius: BorderRadius.circular(
                      15.r,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: PayNestTheme.colorWhite,
                    ),
                    // child: Text(""),
                  ),
                ),
                Spacer(),
                Image.asset(
                  AppAssets().welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Form(
                    key: Utils.newPasswordKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(80),
                        Text(
                          'New Password',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 20,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          child: TextFormField(
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: PayNestTheme.textGrey,
                            ),
                            obscureText: isObscure,
                            obscuringCharacter: '*',
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ),
                              // suffixIcon: IconButton(
                              //   icon: SvgPicture.asset(
                              //     AppAssets.passwordEye,
                              //     color: PayNestTheme.primaryColor,
                              //   ),
                              //   onPressed: () {
                              //     setState(
                              //       () {
                              //         isObscure = !isObscure;
                              //       },
                              //     );
                              //   },
                              // ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              labelText: newPassword,
                              labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: PayNestTheme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Required';
                              }
                              // Check if the entered email has the right format
                              if (value.trim().length < 4) {
                                return 'New Password must not be less than 4';
                              }
                              // Return null if the entered email is valid
                              return null;
                            },
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: cPassword,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: PayNestTheme.textGrey,
                            ),
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ),
                              // suffixIcon: IconButton(
                              //   icon: SvgPicture.asset(
                              //     AppAssets.passwordEye,
                              //     color: PayNestTheme.primaryColor,
                              //   ),
                              //   onPressed: () {
                              //     setState(
                              //       () {
                              //         cPassword = !cPassword;
                              //       },
                              //     );
                              //   },
                              // ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              labelText: confirmPassword,
                              labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: PayNestTheme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Required';
                              }
                              if (value.trim().length < 4) {
                                return 'Confirm Password must not be less than 4';
                              }
                              if (value.toString() !=
                                  newPasswordController.text) {
                                return 'password not matched';
                              }
                              return null;
                            },
                          ),
                        ),
                        verticalSpacer(16),
                        Text(
                          'OTP',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Pinput(
                            length: 5,
                            defaultPinTheme: PinTheme(
                              textStyle: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: PayNestTheme.black,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: PayNestTheme.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              width: sizes.widthRatio * 80,
                              height: sizes.heightRatio * 50,
                            ),
                            controller: otpController,
                            validator: (s) {
                              if (s!.length < 5) {
                                setState(() {
                                  completeCode = false;
                                });
                              }
                              return s.isEmpty ? "Enter Code" : '';
                            },
                            keyboardType: TextInputType.phone,
                            showCursor: true,
                            onCompleted: (pin) {
                              otp = pin;
                              setState(
                                () {
                                  completeCode = true;
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
                    () => Container(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.primaryColor,
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
                                  message:
                                      userController.isFailed.value.toString(),
                                  color: PayNestTheme.primaryColor);
                            }
                          } else {
                            showToast(
                                context: context,
                                message: 'Fields can not be empty!',
                                color: PayNestTheme.primaryColor);
                          }
                        },
                        child: !userController.isLoading.value
                            ? Text(
                                "Reset Password",
                                style: PayNestTheme.subtitle16white.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'montserratBold',
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: PayNestTheme.colorWhite,
                                  color: PayNestTheme.blueAccent,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
