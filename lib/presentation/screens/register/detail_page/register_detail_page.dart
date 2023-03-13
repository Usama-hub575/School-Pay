import 'package:paynest_flutter_app/export.dart';

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emirateIDController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryRegionController = TextEditingController();
  TextEditingController phCodeController = TextEditingController(text: "+971");
  static final registrationFormKey = GlobalKey<FormState>();

  // UserController registerController = Get.put(UserController());
  DateTime tempPickedDate = DateTime.now();

  List<String> gender = ['Male', 'Female'];
  String? _selectedFilter;
  bool isEmiratesSelected = true;
  bool isPassportSelected = false;
  String selectedCountry = "Select Country";
  String countryCode = "AE";
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
    //registerController.hitGetCountriesAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(32),
          Text(
            pleaseEnterDetailBelow,
            style: TextStyles().extraBold.copyWith(
                  fontSize: sizes.fontRatio * 18,
                  color: AppColors().black,
                ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Form(
                  key: registrationFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstNameController,
                        textInputAction: TextInputAction.next,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: AppColors().textGrey,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          labelText: firstName,
                          labelStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: AppColors().red,
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your First name';
                          }
                          return null;
                        },
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: lastNameController,
                        textInputAction: TextInputAction.next,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: AppColors().textGrey,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          labelText: lastName,
                          labelStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: AppColors().red,
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your Last name';
                          }
                          return null;
                        },
                      ),
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Gender *',
                          textAlign: TextAlign.start,
                          style: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
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
                                        style: TextStyles().bold.copyWith(
                                              fontSize: sizes.fontRatio * 14,
                                              color: AppColors().black,
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                  value: _selectedFilter,
                                  hint: const Text(
                                    "Gender",
                                  ),
                                  // value: selection,
                                  onChanged: (newValue) {
                                    setState(
                                      () {
                                        _selectedFilter = newValue.toString();
                                        if (kDebugMode) {
                                          print(
                                            _selectedFilter,
                                          );
                                        }
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
                        width: horizontalValue(1),
                        height: verticalValue(1),
                        color: AppColors().textGrey.withOpacity(
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
                                ? AppColors().primaryColor
                                : AppColors().primaryColor.withOpacity(
                                      0.5,
                                    ),
                            onTap: () {
                              isEmiratesSelected = true;
                              isPassportSelected = false;
                              emirateIDController.clear();
                              setState(() {});
                            },
                          ),
                          _optionalButton(
                            value: 'Passport   ',
                            buttonColor: isPassportSelected
                                ? AppColors().primaryColor
                                : AppColors().primaryColor.withOpacity(
                                      0.5,
                                    ),
                            onTap: () {
                              isEmiratesSelected = false;
                              isPassportSelected = true;
                              emirateIDController.clear();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: emirateIDController,
                        textInputAction: TextInputAction.next,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: AppColors().textGrey,
                            ),
                        inputFormatters: isEmiratesSelected
                            ? <TextInputFormatter>[
                                RegisterEmiratesIdFormatter(
                                  mask: 'xxx-xxxx-xxxxxxx-x',
                                  separator: '-',
                                )
                              ]
                            : [],
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: TextStyles().bold.copyWith(
                                    color: AppColors()
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: sizes.fontRatio * 8,
                                  ),
                            ),
                          ),
                          labelText:
                              isEmiratesSelected ? emiratesIDD : passportNumber,
                          labelStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: AppColors().red,
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      InkWellWidget(
                        onTap: emirateIDController.text != ""
                            ? () {
                                showDialog(
                                  builder: (sdCTX) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          InkWellWidget(
                                            onTap: () {
                                              Navigator.pop(sdCTX);
                                            },
                                            child: Container(
                                              height: verticalValue(25),
                                              width: horizontalValue(70),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppColors().blueAccent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Done",
                                                  style: TextStyles()
                                                      .semiBold
                                                      .copyWith(
                                                        fontSize:
                                                            sizes.fontRatio *
                                                                12,
                                                        color:
                                                            AppColors().white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      // content: SizedBox(
                                      //   width: horizontalValue(0.9),
                                      //   height: verticalValue(0.5),
                                      //   child: CupertinoDatePicker(
                                      //     mode: CupertinoDatePickerMode.date,
                                      //     onDateTimeChanged:
                                      //         (DateTime dateTime) {
                                      //       tempPickedDate = dateTime;
                                      //       expiryController.text =
                                      //           DateFormat("yyyy-MM-dd")
                                      //               .format(dateTime)
                                      //               .toString();
                                      //     },
                                      //     initialDateTime: DateTime.now(),
                                      //   ),
                                      // ),
                                    );
                                  },
                                  context: context,
                                );
                              }
                            : () {},
                        child: TextFormField(
                          controller: expiryController,
                          textInputAction: TextInputAction.next,
                          enabled: false,
                          style: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: AppColors().textGrey,
                              ),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().textGrey.withOpacity(
                                      0.5,
                                    ),
                              ),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                top: verticalValue(24),
                              ),
                              child: Text(
                                optional,
                                style: TextStyles().bold.copyWith(
                                      color: AppColors()
                                          .primaryColor
                                          .withOpacity(0.5),
                                      fontSize: sizes.fontRatio * 8,
                                    ),
                              ),
                            ),
                            labelText: expiry,
                            labelStyle: TextStyles().bold.copyWith(
                                  fontSize: sizes.fontRatio * 12,
                                  color: AppColors().primaryColor,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().textGrey.withOpacity(
                                      0.5,
                                    ),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().textGrey.withOpacity(
                                      0.5,
                                    ),
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().textGrey.withOpacity(
                                      0.5,
                                    ),
                              ),
                            ),
                            errorStyle: TextStyles().bold.copyWith(
                                  fontSize: sizes.fontRatio * 12,
                                  color: AppColors().red,
                                ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().textGrey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Address Detail',
                          textAlign: TextAlign.start,
                          style: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                              ),
                        ),
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: addressController,
                        textInputAction: TextInputAction.next,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: AppColors().textGrey,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: TextStyles().bold.copyWith(
                                    color: AppColors()
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: sizes.fontRatio * 8,
                                  ),
                            ),
                          ),
                          labelText: address,
                          labelStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: AppColors().red,
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      TextFormField(
                        controller: cityController,
                        textInputAction: TextInputAction.done,
                        style: TextStyles().bold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: AppColors().textGrey,
                            ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(top: verticalValue(24)),
                            child: Text(
                              optional,
                              style: TextStyles().bold.copyWith(
                                    color: AppColors()
                                        .primaryColor
                                        .withOpacity(0.5),
                                    fontSize: sizes.fontRatio * 8,
                                  ),
                            ),
                          ),
                          labelText: city,
                          labelStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(
                                    0.5,
                                  ),
                            ),
                          ),
                          errorStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: AppColors().red,
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          countryRegion,
                          textAlign: TextAlign.start,
                          style: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
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
                              phCodeController.text = value.name.toString();
                              countryCode = value.code.toString();
                            });
                          },
                          initialSelection: phCodeController.text,
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          flagDecoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          flagWidth: sizes.fontRatio * 50,
                          textStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 14,
                              ),
                        ),
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors().textGrey.withOpacity(0.5),
                      ),
                      verticalSpacer(12),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors().primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(16),
                      )),
                  onPressed: () async {
                    if (registrationFormKey.currentState!.validate()) {
                      widget.onTap(
                        firstNameController.text,
                        lastNameController.text,
                        _selectedFilter!,
                        emirateIDController.text.replaceAll('-', ''),
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
                        style: TextStyles().semiBold.copyWith(
                              color: AppColors().white,
                              fontSize: sizes.fontRatio * 16,
                            ),
                      ),
                      const Spacer(),
                      // !registerController.isLoading.value
                      //     ? const SizedBox.shrink()
                      //     : SizedBox(
                      //         height: sizes.heightRatio * 16,
                      //         width: sizes.widthRatio * 16,
                      //         child: CircularProgressIndicator(
                      //           backgroundColor: AppColors().white,
                      //           color: AppColors().primaryColor,
                      //           strokeWidth: 2,
                      //         ),
                      //       ),
                      horizontalSpacer(16),
                    ],
                  ),
                ),
                SizedBox(
                  height: verticalValue(24),
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
    return InkWellWidget(
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
              value,
              textAlign: TextAlign.center,
              style: TextStyles().bold.copyWith(
                    color: AppColors().white,
                    fontSize: sizes.fontRatio * 14,
                  ),
            ),
            Text(
              'OPTIONAL',
              textAlign: TextAlign.center,
              style: TextStyles().medium.copyWith(
                    fontSize: sizes.fontRatio * 10,
                    color: AppColors().white,
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
    if (selected != null) {
      setState(() {
        expiryController.text =
            '${selected.day}-${selected.month}-${selected.year}';
      });
    }
  }
}

class RegisterEmiratesIdFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  RegisterEmiratesIdFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
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
