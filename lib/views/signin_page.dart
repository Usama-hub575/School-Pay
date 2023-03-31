import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/utils/utils.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  UserController userController = Get.put(UserController());
  final storage = GetStorage();
  final MySharedPreferences _preferences = MySharedPreferences.instance;

  bool isBioMatric = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  final GlobalKey<ScaffoldState> _scaffoldKey =
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
          horizontal: horizontalValue(25),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                AppBarBackButton(
                  iconColor: PayNestTheme.colorWhite,
                  buttonColor: PayNestTheme.primaryColor,
                ),
                const Spacer(),
                Image.asset(
                  AppAssets().welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                const Spacer(),
              ],
            ),
            verticalSpacer(22),
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
                          style: PayNestTheme.title22black.copyWith(),
                        ),
                        verticalSpacer(16),
                        Text(
                          'Please Enter Your Registered Email ID and Password',
                          style: PayNestTheme.title20primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.black,
                          ),
                        ),
                        verticalSpacer(34),
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
                            labelStyle: PayNestTheme.floating_12primaryColor,
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
                              return 'Please Enter Email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Invalid Email';
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
                            labelStyle: PayNestTheme.floating_12primaryColor,
                            // suffixIcon: IconButton(
                            //   icon: SvgPicture.asset(
                            //     AppAssets.passwordEye,
                            //     color: PayNestTheme.primaryColor,
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isObscure = !isObscure;
                            //     });
                            //   },
                            // ),
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
                              return 'Please Enter Password';
                            }
                            // Check if the entered email has the right format
                            // if (value.trim().length < 4) {
                            //   return 'Password Must Not Be Less Than 5';
                            // }
                            // Return null if the entered email is valid
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(16),
                  InkWellWidget(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed("/ForgotPassword");
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        forgotPassword,
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
                            child: InkWellWidget(
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
                                      showToast(
                                          message: 'Something Went wrong',
                                          context: context,
                                          color: PayNestTheme.red);
                                    }
                                  }
                                }
                              },
                              child: Column(
                                children: [
                                  // Lottie.asset(
                                  //   AppAssets.faceId,
                                  //   height: 109,
                                  //   width: 81,
                                  //   repeat: true,
                                  // ),
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
                          backgroundColor: PayNestTheme.primaryColor,
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
                            if (storage.read('email').toString() ==
                                emailController.text.toString()) {
                              await userController.hitLogin(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                storage.read('fcmToken'),
                              );
                            } else {
                              _preferences.removeAll();
                              storage.write('isBioMatric', false);
                              await userController.hitLogin(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                storage.read('fcmToken'),
                              );
                            }
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
                              showToast(
                                  message: userController
                                          .userResData.value.message ??
                                      userController.errorMessage.toString(),
                                  context: context,
                                  color: PayNestTheme.red);
                            } else if (!userController
                                .userResData.value.status) {
                              passwordController.clear();
                              userController.isLoading.value = false;
                              if (userController.retriesTime.value != '') {
                                showToast(
                                    message:
                                        "Please retry after ${userController.retriesTime.value} min",
                                    context: context,
                                    color: PayNestTheme.red);
                              } else if (userController.attemptsRemain.value !=
                                  '') {
                                showToast(
                                    message:
                                        "${userController.attemptsRemain.value} attempts remaining",
                                    context: context,
                                    color: PayNestTheme.red);
                              } else {
                                showToast(
                                    message:
                                        "Entered email or password does not match",
                                    context: context,
                                    color: PayNestTheme.red);
                              }
                            } else {
                              showToast(
                                  message: "Something went wrong. Try again !!",
                                  context: context,
                                  color: PayNestTheme.red);
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
