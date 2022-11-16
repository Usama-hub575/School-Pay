import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynest_flutter_app/utils/sharedpref.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/custom_slider.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_detail_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_main_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_otp_page.dart';
import 'package:paynest_flutter_app/widgets/toast.dart';
import '../../constants/constants.dart';
import '../../controller/user_controller.dart';
import '../../res/res.dart';
import '../../theme/theme.dart';
import '../../widgets/back_button.dart';
import '../../widgets/spacer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _currentIndex = 0;
  String email = '';
  String password = '';
  String phoneNumber = '';
  String phoneCode = '';
  UserController userController = Get.put(UserController());
  MySharedPreferences preferences = MySharedPreferences.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(25),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                AppBarBackButton(
                  iconColor: PayNestTheme.colorWhite, buttonColor: PayNestTheme.primaryColor,

                ),
                Spacer(),
                Image.asset(
                  welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                Spacer(),
              ],
            ),
            verticalSpacer(16),
            CustomSlider(currentIndex: _currentIndex),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _currentIndex == 0
                      ? RegisterMainPage(
                          onNextTap: (email, password, phoneCode, phoneNumber) {
                            _currentIndex = 1;
                            this.email = email;
                            this.password = password;
                            this.phoneCode = phoneCode;
                            this.phoneNumber = phoneNumber;
                            setState(() {});
                          },
                        )
                      : _currentIndex == 1
                          ? RegisterOtpPage(
                              email: email,
                              password: password,
                              phoneCode: phoneCode,
                              phoneNumber: phoneNumber,
                              onSuccess: () {
                                _currentIndex = 2;
                                setState(() {});
                              },
                            )
                          : RegisterDetailPage(
                              email: email,
                              password: password,
                              phoneCode: phoneCode,
                              phoneNumber: phoneCode,
                              onTap: (
                                fName,
                                lName,
                                gender,
                                emiratesID,
                                expiryDate,
                                address,
                                city,
                                countryCode,
                                country,
                              ) async {
                                await userController.hitRegister(
                                  fName,
                                  lName,
                                  password,
                                  email,
                                  countryCode,
                                  phoneCode,
                                  phoneNumber,
                                  emiratesID,
                                  gender,
                                  '',
                                  emiratesID,
                                );
                                if (userController.userResData.value.status ==
                                    true) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/DashboardPage',
                                      (Route<dynamic> route) => false);
                                } else {
                                  showToast(messege: userController.isFailed.toString(), context: context, color: PayNestTheme.red);
                                }
                              },
                            );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
