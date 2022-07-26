import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../constants/constants.dart';
import '../../../model/datamodel/reg1_to_otp.dart';
import '../../../res/assets.dart';
import '../../../res/res.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/blue_back_button.dart';
import '../../custom_phone_number_field/country_code_picker.dart';

class RegisterMainPage extends StatefulWidget {
  const RegisterMainPage({
    Key? key,
    required this.onNextTap,
  }) : super(key: key);

  final Function(
    String email,
    String password,
    String phoneCode,
    String phoneNumber,
  ) onNextTap;

  @override
  State<RegisterMainPage> createState() => _RegisterMainPageState();
}

class _RegisterMainPageState extends State<RegisterMainPage> {
  bool loading = false;
  bool terms = false;
  bool isObscure = true;
  bool cPassword = true;
  var flag, countryCode;

  TextEditingController phoneController = TextEditingController();
  TextEditingController phCodeController = TextEditingController(text: "+971");
  TextEditingController emailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 23.h, bottom: 12.h),
            child: Text(
              pleaseEnterYourPhoneNumberAndEmailId,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 18,
                color: PayNestTheme.black,
                fontFamily: 'montserratExtraBold',
              ),
            ),
          ),
          Expanded(
            child: Form(
              key: Utils.reg1FormKey,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  _numberField(),
                  verticalSpacer(12),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    child: TextFormField(
                      controller: emailController,
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
                          return 'Required';
                        }
                        // Check if the entered email has the right format
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Correct email required';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                    ),
                  ),
                  verticalSpacer(12),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    child: TextFormField(
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.textGrey,
                      ),
                      obscureText: isObscure,
                      obscuringCharacter: '*',
                      controller: createPasswordController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.passwordEye,
                            color: PayNestTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                isObscure = !isObscure;
                              },
                            );
                          },
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.5),
                          ),
                        ),
                        labelText: createPassword,
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
                          return 'Required';
                        }
                        // Check if the entered email has the right format
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                    ),
                  ),
                  verticalSpacer(12),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
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
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.passwordEye,
                            color: PayNestTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                cPassword = !cPassword;
                              },
                            );
                          },
                        ),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Required';
                        }
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpacer(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: terms,
                        focusColor: PayNestTheme.primaryColor,
                        activeColor: PayNestTheme.primaryColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        onChanged: (newValue) {
                          setState(() {
                            terms = !terms;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I accept',
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: PayNestTheme.black,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                            const TextSpan(
                              text: '  ',
                            ),
                            TextSpan(
                              text: ' Terms & Conditions',
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: PayNestTheme.primaryColor,
                                decoration: TextDecoration.underline,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  verticalSpacer(44),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PayNestTheme.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            14,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(16),
                        ),
                      ),
                      onPressed: () {
                        if (Utils.reg1FormKey.currentState!.validate() &&
                            terms == true) {
                          widget.onNextTap(
                            emailController.text,
                            createPasswordController.text,
                            phCodeController.text,
                            phoneController.text,
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          next,
                          style: PayNestTheme.title_2_16primaryColor.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: PayNestTheme.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            or,
                            style: PayNestTheme.h2_14textGrey,
                          ),
                        ),
                        Container(
                          height: 1.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 326.w,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(googleicon),
                      label: Text(
                        google,
                        style: PayNestTheme.title_3_16black,
                      ),
                      style: OutlinedButton.styleFrom(
                        // primary: MyTheme.sharpGreen,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        side: BorderSide(
                            color: PayNestTheme.primaryColor, width: 1.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 326.w,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(facebookicon),
                      label: Text(
                        facebook,
                        style: PayNestTheme.title_3_16black,
                      ),
                      style: OutlinedButton.styleFrom(
                        // primary: MyTheme.sharpGreen,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        side: BorderSide(
                            color: PayNestTheme.primaryColor, width: 1.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberField() {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PayNestTheme.textGrey.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            padding: EdgeInsets.zero,
            showDropDownButton: true,
            onChanged: (value) {
              setState(() {
                phCodeController.text = value.toString();
              });
            },
            initialSelection: phCodeController.text,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            flagDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            flagWidth: sizes.fontRatio * 50,
            textStyle: PayNestTheme.title_2_16primaryColor.copyWith(
              fontSize: sizes.fontRatio * 14,
              color: PayNestTheme.primaryColor,
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: '987 654 321',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: PayNestTheme.lightBlack,
                  fontFamily: 'montserratBold',
                ),
                border: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
