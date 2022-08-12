import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_country_code_picker.dart';
import '../../../constants/constants.dart';
import '../../../controller/user_controller.dart';
import '../../../res/res.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/spacer.dart';
import '../../custom_phone_number_field/country_code_picker.dart';

class RegisterDetailPage extends StatefulWidget {
  const RegisterDetailPage({
    Key? key,
    required this.phoneCode,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.onTap,
  }) : super(key: key);

  final String phoneCode;
  final String phoneNumber;
  final String email;
  final String password;
  final Function(
    String fName,
    String lName,
    String gender,
    String emiratesId,
    String expiryDate,
    String address,
    String city,
    String countryCode,
    String country,
  ) onTap;

  @override
  State<RegisterDetailPage> createState() => _RegisterDetailPageState();
}

class _RegisterDetailPageState extends State<RegisterDetailPage> {
  bool loading = false;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emirateIDController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryRegionController = TextEditingController();
  TextEditingController phCodeController = TextEditingController(text: "+971");

  UserController registerController = Get.put(UserController());

  List<String> gender = ['Male', 'Female'];
  String? _selectedFilter;
  bool isEmiratesSelected = true;
  bool isPassportSelected = false;
  String selectedCountry = "Select Country";
  String countryCode = "";
  String flag = '';

  @override
  void initState() {
    super.initState();
    _selectedFilter = 'Male';
    isEmiratesSelected = true;
    isPassportSelected = false;
    getCountries();
  }

  void getCountries() {
    registerController.hitGetCountriesAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(32),
          Text(
            pleaseenterdetailbelow,
            style: PayNestTheme.title_2_16primaryColor.copyWith(
              fontSize: sizes.fontRatio * 18,
              fontFamily: 'montserratExtraBold',
              color: PayNestTheme.black,
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Form(
                  key: Utils.registrationFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fnameController,
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
                          labelText: firstName,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
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
                            return 'Please enter your Full name';
                          }
                          if (value.trim().length < 5) {
                            return 'Name must not be less than 5';
                          }
                          return null;
                        },
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: lnameController,
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
                          labelText: lastName,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
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
                            return 'Please enter your Full name';
                          }
                          if (value.trim().length < 5) {
                            return 'Name must not be less than 5';
                          }
                          return null;
                        },
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'Gender *',
                          textAlign: TextAlign.start,
                          style: PayNestTheme.title20white.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PayNestTheme.primaryColor,
                            fontSize: sizes.fontRatio * 12,
                            fontFamily: 'montserratMedium',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  elevation: 0,
                                  isExpanded: true,
                                  items: gender.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: PayNestTheme.h2_12blueAccent
                                            .copyWith(
                                          fontSize: sizes.fontRatio * 14,
                                          fontWeight: FontWeight.bold,
                                          color: PayNestTheme.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  value: _selectedFilter,
                                  hint: Text(
                                    "Gender",
                                  ),
                                  // value: selection,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        _selectedFilter = newValue.toString();
                                        print(
                                          _selectedFilter,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.textGrey.withOpacity(
                          0.5,
                        ),
                      ),
                      verticalSpacer(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _optionalButton(
                            value: 'Emirates ID',
                            buttonColor: isEmiratesSelected
                                ? PayNestTheme.primaryColor
                                : PayNestTheme.primaryColor.withOpacity(
                                    0.5,
                                  ),
                            onTap: () {
                              isEmiratesSelected = true;
                              isPassportSelected = false;
                              setState(() {});
                            },
                          ),
                          _optionalButton(
                            value: 'Passport   ',
                            buttonColor: isPassportSelected
                                ? PayNestTheme.primaryColor
                                : PayNestTheme.primaryColor.withOpacity(
                                    0.5,
                                  ),
                            onTap: () {
                              isEmiratesSelected = false;
                              isPassportSelected = true;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: emirateIDController,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: PayNestTheme.textGrey,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: PayNestTheme.h2_14textGrey.copyWith(
                                color:
                                    PayNestTheme.primaryColor.withOpacity(0.5),
                                fontSize: sizes.fontRatio * 8,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ),
                          labelText:
                              isEmiratesSelected ? emiratesIDD : passportNumber,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: expiryController,
                        enabled: emirateIDController.text != "" ? true : false,
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
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: PayNestTheme.h2_14textGrey.copyWith(
                                color:
                                    PayNestTheme.primaryColor.withOpacity(0.5),
                                fontSize: sizes.fontRatio * 8,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ),
                          labelText: expiry,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'Address Detail',
                          textAlign: TextAlign.start,
                          style: PayNestTheme.title20white.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PayNestTheme.primaryColor,
                            fontSize: sizes.fontRatio * 16,
                            fontFamily: 'montserratBold',
                          ),
                        ),
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: addressController,
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
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: PayNestTheme.h2_14textGrey.copyWith(
                                color:
                                    PayNestTheme.primaryColor.withOpacity(0.5),
                                fontSize: sizes.fontRatio * 8,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ),
                          labelText: address,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: cityController,
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
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: PayNestTheme.h2_14textGrey.copyWith(
                                color:
                                    PayNestTheme.primaryColor.withOpacity(0.5),
                                fontSize: sizes.fontRatio * 8,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ),
                          labelText: city,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
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
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        child: Text(
                          countryRegion,
                          textAlign: TextAlign.start,
                          style: PayNestTheme.title20white.copyWith(
                            fontWeight: FontWeight.bold,
                            color: PayNestTheme.primaryColor,
                            fontSize: sizes.fontRatio * 12,
                            fontFamily: 'montserratMedium',
                          ),
                        ),
                      ),
                      verticalSpacer(8),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: RegisterCountryCodePicker(
                          borderColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          showDropDownButton: true,
                          onChanged: (value) {
                            setState(() {
                              phCodeController.text =      value.name.toString();
                              countryCode= value.code.toString();
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
                          textStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: PayNestTheme.textGrey.withOpacity(0.5),
                      ),
                      verticalSpacer(12),
                    ],
                  ),
                ),
                Obx(
                  () => TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: PayNestTheme.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(16),
                        )),
                    onPressed: () async {
                      if (Utils.registrationFormKey.currentState!.validate()) {
                        widget.onTap(
                          fnameController.text,
                          lnameController.text,
                          _selectedFilter!,
                          emirateIDController.text,
                          expiryController.text,
                          addressController.text,
                          cityController.text,
                          countryCode,
                          countryRegionController.text,

                        );
                      }
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          next,
                          style: PayNestTheme.subtitle16white,
                        ),
                        const Spacer(),
                        !registerController.isLoading.value
                            ? const SizedBox.shrink()
                            : Container(
                                height: sizes.heightRatio * 16,
                                width: sizes.widthRatio * 16,
                                child: CircularProgressIndicator(
                                  backgroundColor: PayNestTheme.colorWhite,
                                  color: PayNestTheme.primaryColor,
                                  strokeWidth: 2,
                                ),
                              ),
                        horizontalSpacer(16),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionalButton({
    required Color buttonColor,
    required Function onTap,
    required String value,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(40),
          vertical: verticalValue(16),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            Text(
              '$value',
              textAlign: TextAlign.center,
              style: PayNestTheme.title20white.copyWith(
                fontWeight: FontWeight.bold,
                color: PayNestTheme.colorWhite,
                fontSize: sizes.fontRatio * 14,
                fontFamily: 'montserratBold',
              ),
            ),
            Text(
              'OPTIONAL',
              textAlign: TextAlign.center,
              style: PayNestTheme.title20white.copyWith(
                fontSize: sizes.fontRatio * 10,
                color: PayNestTheme.colorWhite,
                fontFamily: 'montserratMedium',
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
