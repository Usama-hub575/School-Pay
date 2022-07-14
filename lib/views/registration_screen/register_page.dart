import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/custom_slider.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_detail_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_main_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_otp_page.dart';
import '../../constants/constants.dart';
import '../../res/res.dart';
import '../../theme/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
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
                    color: PayNestTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_currentIndex == 0) {
                        Navigator.of(context).pop();
                      } else {
                        _currentIndex -= _currentIndex;
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: PayNestTheme.colorWhite,
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
