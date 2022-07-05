import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/res/assets.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  UserController userController = Get.put(UserController());
  final storage = GetStorage();

  bool isObscure = true;
  bool isBioMatric = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(60),
            Row(
              children: [
                BlueBackButton(
                  context: context,
                ),
                Spacer(),
                Text(
                  signIn,
                  style: PayNestTheme.title20primaryColor,
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
                    key: Utils.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(16),
                        Text(
                          'Sign In',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 20,
                            color: PayNestTheme.black,
                          ),
                        ),
                        verticalSpacer(16),
                        Text(
                          'Please Enter Your Registered Email ID and Password',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        verticalSpacer(16),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
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
                            // Check if the entered email has the right format
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Invalid email';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                        ),
                        verticalSpacer(16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isObscure,
                          style: PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.textGrey,
                          ),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: PayNestTheme.textGrey.withOpacity(
                                  0.5,
                                ),
                              ),
                            ),
                            labelText: password,
                            labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 12,
                              color: PayNestTheme.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.passwordEye,
                                color: PayNestTheme.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: PayNestTheme.textGrey.withOpacity(
                                  0.5,
                                ),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: PayNestTheme.textGrey.withOpacity(
                                  0.5,
                                ),
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
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
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter password';
                            }
                            // Check if the entered email has the right format
                            if (value.trim().length < 5) {
                              return 'Password must not be less than 5';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      forgotpassword,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                  ),
                  isBioMatric
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 28.52.h),
                            child: GestureDetector(
                              onTap: () async {
                                if (!isLoading) {
                                  // bool isAuthenticated = await LocalAuthApi
                                  //     .authenticateWithBiometrics();
                                  // if (isAuthenticated) {
                                  //   setState(() {
                                  //     isLoading = true;
                                  //   });
                                  //   // String phone = storage
                                  //   //     .getStringValue(SharedPrefKeys.userPhone);
                                  //   // String password = storage.getStringValue(
                                  //   //     SharedPrefKeys.userPassword);
                                  //   // await userLogin(
                                  //   //   phone,
                                  //   //   password,
                                  //   // );
                                  // }
                                }
                              },
                              child: Column(
                                children: [
                                  Lottie.asset(
                                    AppAssets.faceId,
                                    height: 109,
                                    width: 81,
                                    repeat: true,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      'Login with Touch ID',
                                      style:
                                          PayNestTheme.h2_12blueAccent.copyWith(
                                        fontSize: sizes.fontRatio * 18,
                                        color: PayNestTheme.black,
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
                            if (Utils.loginFormKey.currentState!.validate()) {
                              await userController.hitLogin(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                storage.read('fcmToken'),
                              );
                              if (userController.userResData.value.status ==
                                  true) {
                                storage.write(
                                  'accessToken',
                                  userController.userResData.value.token,
                                );
                                storage.write(
                                    'email',
                                    userController
                                        .userResData.value.parent!.email);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/DashboardPage',
                                  (Route<dynamic> route) => false,
                                );
                              } else if (userController
                                      .userResData.value.status ==
                                  false) {
                                passwordController.clear();
                                userController.isLoading.value = false;

                                if (userController.retriesTime.value != '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Please retry after " +
                                            userController.retriesTime.value
                                                .toString() +
                                            " min",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (userController
                                        .attemptsRemain.value !=
                                    '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        userController.attemptsRemain.value
                                                .toString() +
                                            " attempts remaining",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Entered email or password does not match",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Entered email or password does not match",
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child: !userController.isLoading.value
                              ? Text(signIn,
                                  style: PayNestTheme.subtitle16white)
                              : Center(
                                  child: CircularProgressIndicator(
                                  backgroundColor: PayNestTheme.colorWhite,
                                  color: PayNestTheme.blueAccent,
                                ))),
                    ),
                  ),
                  verticalSpacer(20),
                  Row(
                    children: [
                      Container(
                        height: 1.5,
                        width: sizes.width / 2.5,
                        color: PayNestTheme.primaryColor,
                      ),
                      horizontalSpacer(10),
                      Text(
                        or,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: PayNestTheme.black,
                        ),
                      ),
                      horizontalSpacer(10),
                      Container(
                        height: 1.5,
                        width: sizes.width / 2.5,
                        color: PayNestTheme.primaryColor,
                      ),
                    ],
                  ),
                  verticalSpacer(20),
                  Container(
                    width: double.infinity,
                    height: sizes.heightRatio * 46,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PayNestTheme.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          googleicon,
                        ),
                        horizontalSpacer(8),
                        Text(
                          google,
                          style: PayNestTheme.title_2_16primaryColor.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PayNestTheme.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16),
                  Container(
                    width: double.infinity,
                    height: sizes.heightRatio * 46,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PayNestTheme.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          facebookicon,
                        ),
                        horizontalSpacer(8),
                        Text(
                          facebook,
                          style: PayNestTheme.title_2_16primaryColor.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PayNestTheme.black,
                          ),
                        ),
                      ],
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
