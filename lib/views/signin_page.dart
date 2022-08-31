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
import 'package:paynest_flutter_app/utils/sharedpref.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../auth/local_auth_api.dart';
import '../utils/sharedPrefKeys.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  UserController userController = Get.put(UserController());
  final storage = GetStorage();
  MySharedPreferences _preferences = MySharedPreferences.instance;

  bool isBioMatric = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'signIn');

  isBioMatricEnable() {
    isBioMatric = _preferences.getBoolValue(SharedPrefKeys.isBioMatric);
  }

  @override
  void initState() {
    isBioMatricEnable();
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
                Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                  ),
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius: BorderRadius.circular(
                        12.r,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        color: PayNestTheme.colorWhite,
                      ),
                    ),
                  ),
                ),
                Spacer(),
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
                    key: Utils.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(16),
                        Text(
                          'Sign In',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 22,
                            color: PayNestTheme.black,
                          ),
                        ),
                        verticalSpacer(16),
                        Text(
                          'Please Enter Your Registered Email ID and Password',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        verticalSpacer(16),
                        TextFormField(
                          style: TextStyle(fontSize: sizes.fontRatio * 16),
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
                        verticalSpacer(16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isObscure,
                          style: PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 16,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed("/ForgotPassword");
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        forgotpassword,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: PayNestTheme.primaryColor,
                        ),
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
                                  bool isAuthenticated = await LocalAuthApi
                                      .authenticateWithBiometrics();
                                  if (isAuthenticated) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String email = _preferences.getStringValue(
                                      SharedPrefKeys.userEmail,
                                    );
                                    String password =
                                        _preferences.getStringValue(
                                      SharedPrefKeys.userPassword,
                                    );
                                    await userController.hitLogin(
                                      email,
                                      password,
                                      storage.read(
                                        'fcmToken',
                                      ),
                                    );
                                    if (userController
                                        .userResData.value.status) {
                                      storage.write(
                                        SharedPrefKeys.accessToken,
                                        userController.userResData.value.token,
                                      );
                                      storage.write(
                                        SharedPrefKeys.userEmail,
                                        userController
                                            .userResData.value.parent!.email,
                                      );
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/DashboardPage',
                                        (Route<dynamic> route) => false,
                                      );
                                    } else if (userController
                                                .userResData.value.status ==
                                            "" ||
                                        !userController
                                            .userResData.value.status) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Something Went wrong',
                                            textAlign: TextAlign.center,
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  }
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
                            if (userController.userResData.value.status) {
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
                            } else if (!userController
                                .userResData.value.status) {
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
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else if (userController.attemptsRemain.value !=
                                  '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      userController.attemptsRemain.value
                                              .toString() +
                                          " attempts remaining",
                                    ),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Entered email or password does not match",
                                    ),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Something went wrong. Try again !!",
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          }
                        },
                        child: !userController.isLoading.value
                            ? Text(signIn,
                                style: PayNestTheme.subtitle16white
                                    .copyWith(fontSize: sizes.fontRatio * 14))
                            : Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: PayNestTheme.colorWhite,
                                  color: PayNestTheme.blueAccent,
                                ),
                              ),
                      ),
                    ),
                  ),
                  verticalSpacer(20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height: 1.5,
                  //         color: PayNestTheme.primaryColor,
                  //       ),
                  //     ),
                  //     horizontalSpacer(10),
                  //     Text(
                  //       or,
                  //       style: PayNestTheme.title_2_16primaryColor.copyWith(
                  //         fontSize: sizes.fontRatio * 14,
                  //         color: PayNestTheme.black,
                  //       ),
                  //     ),
                  //     horizontalSpacer(10),
                  //     Expanded(
                  //       child: Container(
                  //         height: 1.5,
                  //         color: PayNestTheme.primaryColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // verticalSpacer(20),
                  // Container(
                  //   width: double.infinity,
                  //   height: sizes.heightRatio * 46,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: PayNestTheme.primaryColor,
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         googleicon,
                  //       ),
                  //       horizontalSpacer(8),
                  //       Text(
                  //         google,
                  //         style: PayNestTheme.title_2_16primaryColor.copyWith(
                  //           fontWeight: FontWeight.bold,
                  //           color: PayNestTheme.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // verticalSpacer(16),
                  // Container(
                  //   width: double.infinity,
                  //   height: sizes.heightRatio * 46,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: PayNestTheme.primaryColor,
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         facebookicon,
                  //       ),
                  //       horizontalSpacer(8),
                  //       Text(
                  //         facebook,
                  //         style: PayNestTheme.title_2_16primaryColor.copyWith(
                  //           fontWeight: FontWeight.bold,
                  //           color: PayNestTheme.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
