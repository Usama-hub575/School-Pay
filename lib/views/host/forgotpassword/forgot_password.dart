import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:paynest_flutter_app/controller/register_controller.dart';
import '../../../constants/constants.dart';
import '../../../controller/user_controller.dart';
import '../../../res/res.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/spacer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  UserController userController = Get.put(UserController());
  TextEditingController emailController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'forgotPassword');

  RegisterController registerController = RegisterController();

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
                  iconColor: PayNestTheme.colorWhite, buttonColor: PayNestTheme.primaryColor,

                ),                Spacer(),
                Image.asset(
                  welcomeRegisterLogo,
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
                    key: Utils.forgotPasswordKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(80),
                        Text(
                          'Forgot Password',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 20,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(16),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: PayNestTheme.textGrey.withOpacity(
                                  0.5,
                                ),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: PayNestTheme.textGrey.withOpacity(0.5),
                              ),
                            ),
                            labelText: email,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Invalid email';
                            }
                            return null;
                          },
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
                          if(Utils.forgotPasswordKey.currentState!.validate()){
                            await registerController
                                .hitForgotPassword(emailController.text);
                            if (registerController.forgotPasswordResData.value.status ==
                                true) {
                              Navigator.of(context).pushNamed(
                                '/NewPassword',
                                arguments: emailController.text.toString()
                              );
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    registerController.isFailed.value.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Email field is empty',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          // setState(() {
                          //   CustomAlertDialog.baseDialog(
                          //     context: context,
                          //     title: "Success!",
                          //     message:
                          //     "Email Send Successfully",
                          //     showCrossIcon: false,
                          //     buttonAction: () {
                          //       Navigator.of(context).pop();
                          //     },
                          //   );
                          // });
                        },
                        child: !registerController.isLoading.value
                            ? Text("Send Email",
                                style: PayNestTheme.subtitle16white.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'montserratBold',
                                ))
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
