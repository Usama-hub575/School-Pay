import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../constants/constants.dart';
import '../../../model/datamodel/reg1_to_otp.dart';
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
              pleaseenterdetailbelow,
              style: PayNestTheme.title22black,
            ),
          ),
          Text(
            weuseyourphone,
            style: PayNestTheme.h2_14textGrey,
          ),
          Expanded(
            child: Form(
              key: Utils.reg1FormKey,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  _numberField(),
                  SizedBox(
                    height: 13.h,
                  ),
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
                  verticalSpacer(12),
                  TextFormField(
                    controller: createPasswordController,
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
                  verticalSpacer(12),
                  TextFormField(
                    controller: confirmPasswordController,
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
                      // Check if the entered email has the right format
                      if (value.trim().length < 5) {
                        return 'Password must not be less than 5';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  CheckboxListTile(
                    value: terms,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Row(
                      children: [
                        Text(
                          'I accept',
                          style: PayNestTheme.small_14black,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              ' Terms & Conditions.',
                              style: PayNestTheme.small_14blueAccent,
                            )),
                      ],
                    ),
                    contentPadding: EdgeInsets.all(0),
                    onChanged: (newValue) {
                      setState(() {
                        terms = !terms;
                      });
                    },
                    activeColor: PayNestTheme.blueAccent,
                  ),
                  SizedBox(
                    height: 52.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    width: 326.w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: PayNestTheme.blueAccent,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              next,
                              style: PayNestTheme.subtitle16white,
                            ),
                            !loading
                                ? ClipOval(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: PayNestTheme.colorWhite,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: PayNestTheme.blueAccent,
                                        size: 12.sp,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 10.sp,
                                    width: 10.sp,
                                    child: CircularProgressIndicator(
                                      backgroundColor: PayNestTheme.colorWhite,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      // label:
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
          ),
          Container(
            width: 1,
            height: 10,
            color: PayNestTheme.textGrey,
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: phone,
                border: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!GetUtils.isPhoneNumber(value!)) {
                  return "Please enter valid number";
                } else {
                  return null;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
