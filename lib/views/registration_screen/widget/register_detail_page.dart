import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants.dart';
import '../../../controller/user_controller.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/blue_back_button.dart';

class RegisterDetailPage extends StatefulWidget {
  const RegisterDetailPage({
    Key? key,
    required this.phoneCode,
    required this.password,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  final String phoneCode;
  final String phoneNumber;
  final String email;
  final String password;

  @override
  State<RegisterDetailPage> createState() => _RegisterDetailPageState();
}

class _RegisterDetailPageState extends State<RegisterDetailPage> {

  bool loading = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emirateIDController = TextEditingController();
  TextEditingController expiryController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  UserController registerController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    setState(() {
      phoneController.text = widget.phoneCode + widget.phoneNumber;
      emailController.text = widget.email;
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BlueBackButton(
                  context: context,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(register, style: PayNestTheme.title20primaryColor),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h, bottom: 38.h),
              child: Text(
                pleaseenterdetailbelow,
                style: PayNestTheme.title22black,
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Form(
                    key: Utils.registrationFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personalInformation,
                          style: PayNestTheme.title_2_16primaryColor,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: phoneController,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: phone,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          controller: emailController,
                          enabled: false,
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: email,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          controller: fnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: fname,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          controller: lnameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: lname,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          controller: emirateIDController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: emiratesID,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            EmiratesIdFormatter(
                              mask: 'xxx-xxxx-xxxxxxx-x',
                              separator: '-',
                            )
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: expiryController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: expiry,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Expiry date is invalid';
                            }
                            return null;
                          },
                          onTap: () {
                            _selectExpiryDate(context);
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          addressDetails,
                          style: PayNestTheme.title_2_16primaryColor,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: address,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          controller: areaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: area,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: countryController,
                          validator: (value) {
                            if (countryController.text.isEmpty) {
                              return 'Country is empty';
                            }
                            // Return null if the entered
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0.w)),
                            labelText: country,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              showWorldWide: false,
                              onSelect: (Country country) {
                                setState(
                                      () {
                                    countryController.text = country.name;
                                  },
                                );
                              },
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                // Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Find your Country',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                  Obx(() => SizedBox(
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
                      onPressed: () async {
                        if (Utils.registrationFormKey.currentState!
                            .validate()) {
                          /// Hit Register API via Controller
                          await registerController.hitRegister(
                              emailController.text,
                              phoneController.text,
                              widget.password,
                              fnameController.text,
                              lnameController.text,
                              widget.phoneCode,
                              countryController.text,
                              emirateIDController.text,
                              areaController.text,
                              countryController.text,
                              addressController.text,
                              "E23123");
                          if (registerController.userResData.value.status ==
                              true) {
                            Navigator.pushNamed(context, '/CreatePin');
                          } else if (registerController
                              .userResData.value.status ==
                              true) {
                            print("");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(registerController
                                        .isFailed
                                        .toString())));
                            print(registerController.isFailed);
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            next,
                            style: PayNestTheme.subtitle16white,
                          ),
                          !registerController.isLoading.value
                              ? Icon(
                            Icons.play_circle_fill,
                            color: PayNestTheme.colorWhite,
                          )
                              : SizedBox(
                            height: 10.sp,
                            width: 10.sp,
                            child: CircularProgressIndicator(
                              backgroundColor:
                              PayNestTheme.colorWhite,
                            ),
                          ),
                        ],
                      ),
                      // label:
                    ),
                  )),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectExpiryDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );
    if (selected != null)
      setState(() {
        expiryController.text =
        '${selected.day}-${selected.month}-${selected.year}';
      });
  }
}

class EmiratesIdFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  EmiratesIdFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
