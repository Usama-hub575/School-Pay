import 'package:country_code_picker/country_code_picker.dart';
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(
                        16,
                      ),
                    ),
                    child: CheckboxListTile(
                      value: terms,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Row(
                        children: [
                          Text(
                            'I accept',
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: PayNestTheme.black,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              ' Terms & Conditions.',
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: PayNestTheme.primaryColor,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ),
                        ],
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          terms = !terms;
                        });
                      },
                      activeColor: PayNestTheme.blueAccent,
                    ),
                  ),
                  verticalSpacer(54),
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
                      children: [
                        Container(
                          height: 1.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.textGrey,
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
                            color: PayNestTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 60.h,
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
            flagWidth: sizes.fontRatio*40,
            textStyle: PayNestTheme.title_2_16primaryColor.copyWith(
              fontSize: sizes.fontRatio * 14,
              color: PayNestTheme.primaryColor,
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: '987 654 321',
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
