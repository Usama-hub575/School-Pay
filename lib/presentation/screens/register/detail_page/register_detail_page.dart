import 'package:paynest_flutter_app/export.dart';

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

  // final Function(
  //   String firstName,
  //   String lastName,
  //   String gender,
  //   String emiratesId,
  //   String expiryDate,
  //   String address,
  //   String city,
  //   String countryCode,
  //   String country,
  // ) onTap;

  @override
  State<RegisterDetailPage> createState() => _RegisterDetailPageState();
}

class _RegisterDetailPageState extends State<RegisterDetailPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emirateIDController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryRegionController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController(
    text: "+971",
  );
  static final registrationFormKey = GlobalKey<FormState>();
  DateTime tempPickedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<RegisterDetailPageBloc>().add(
          Init(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterDetailPageBloc, RegisterDetailPageState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(32),
              Text(
                pleaseEnterDetailBelow,
                style: textStyles.extraBold.copyWith(
                  fontSize: sizes.fontRatio * 18,
                  color: colors.black,
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
                          CommonTextField(
                            onValidate: (value) {},
                            controller: firstNameController,
                            labelText: firstName,
                            validatorText: pleaseEnterFirstName,
                            obscureText: false,
                            readOnly:
                                state.status == RegisterDetailPageStatus.loading
                                    ? true
                                    : false,
                          ),
                          verticalSpacer(12),
                          CommonTextField(
                            readOnly:
                                state.status == RegisterDetailPageStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: lastNameController,
                            labelText: lastName,
                            validatorText: pleaseEnterLastName,
                            obscureText: false,
                          ),
                          verticalSpacer(12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              gender,
                              textAlign: TextAlign.start,
                              style: textStyles.bold.copyWith(
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
                                      items: state.gender.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: textStyles.bold.copyWith(
                                              fontSize: sizes.fontRatio * 14,
                                              color: colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      value: state.selectedFilter,
                                      hint: const Text(
                                        genderHintText,
                                      ),
                                      // value: selection,
                                      onChanged: (newValue) {
                                        context
                                            .read<RegisterDetailPageBloc>()
                                            .add(
                                              SelectedFilter(
                                                newValue: newValue.toString(),
                                              ),
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
                            color: colors.textGrey.withOpacity(
                              0.5,
                            ),
                          ),
                          verticalSpacer(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              optionalButton(
                                value: 'Emirates ID',
                                buttonColor: state.isEmiratesSelected
                                    ? colors.primaryColor
                                    : colors.primaryColor.withOpacity(
                                        0.5,
                                      ),
                                onTap: () {
                                  state.isEmiratesSelected = true;
                                  state.isPassportSelected = false;
                                  emirateIDController.clear();
                                  setState(() {});
                                },
                              ),
                              optionalButton(
                                value: 'Passport   ',
                                buttonColor: state.isPassportSelected
                                    ? colors.primaryColor
                                    : colors.primaryColor.withOpacity(
                                        0.5,
                                      ),
                                onTap: () {
                                  state.isEmiratesSelected = false;
                                  state.isPassportSelected = true;
                                  emirateIDController.clear();
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          verticalSpacer(12),
                          CommonTextField(
                            readOnly:
                                state.status == RegisterDetailPageStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: emirateIDController,
                            labelText: state.isEmiratesSelected
                                ? emiratesID
                                : passportNumber,
                            inputFormatters: state.isEmiratesSelected
                                ? <TextInputFormatter>[
                                    RegisterEmiratesIdFormatter(
                                      mask: 'xxx-xxxx-xxxxxxx-x',
                                      separator: '-',
                                    )
                                  ]
                                : [],
                            icon: Padding(
                              padding: EdgeInsets.only(top: verticalValue(24)),
                              child: Text(
                                optional,
                                style: textStyles.bold.copyWith(
                                  color: colors.primaryColor.withOpacity(0.5),
                                  fontSize: sizes.fontRatio * 8,
                                ),
                              ),
                            ),
                            obscureText: false,
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
                                                        BorderRadius.circular(
                                                            12),
                                                    color: colors.blueAccent,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      done,
                                                      style: textStyles.semiBold
                                                          .copyWith(
                                                        fontSize:
                                                            sizes.fontRatio *
                                                                12,
                                                        color: colors.white,
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
                            child: CommonTextField(
                              readOnly: state.status ==
                                      RegisterDetailPageStatus.loading
                                  ? true
                                  : false,
                              onValidate: (value) {},
                              controller: expiryController,
                              labelText: expiry,
                              obscureText: false,
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  top: verticalValue(24),
                                ),
                                child: Text(
                                  optional,
                                  style: textStyles.bold.copyWith(
                                    color: colors.primaryColor.withOpacity(0.5),
                                    fontSize: sizes.fontRatio * 8,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              addressDetails,
                              textAlign: TextAlign.start,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          CommonTextField(
                            readOnly:
                                state.status == RegisterDetailPageStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: addressController,
                            labelText: address,
                            obscureText: false,
                            icon: Padding(
                              padding: EdgeInsets.only(top: verticalValue(24)),
                              child: Text(
                                optional,
                                style: textStyles.bold.copyWith(
                                  color: colors.primaryColor.withOpacity(0.5),
                                  fontSize: sizes.fontRatio * 8,
                                ),
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          CommonTextField(
                            readOnly:
                                state.status == RegisterDetailPageStatus.loading
                                    ? true
                                    : false,
                            onValidate: (value) {},
                            controller: cityController,
                            labelText: city,
                            obscureText: false,
                            icon: Padding(
                              padding: EdgeInsets.only(top: verticalValue(24)),
                              child: Text(
                                optional,
                                style: textStyles.bold.copyWith(
                                  color: colors.primaryColor.withOpacity(0.5),
                                  fontSize: sizes.fontRatio * 8,
                                ),
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              countryRegion,
                              textAlign: TextAlign.start,
                              style: textStyles.bold.copyWith(
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
                                  countryRegionController.text =
                                      value.name.toString();
                                  state.countryCode = value.code.toString();
                                });
                              },
                              initialSelection: phoneCodeController.text,
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              flagDecoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              flagWidth: sizes.fontRatio * 50,
                              textStyle: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 14,
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: colors.textGrey.withOpacity(0.5),
                          ),
                          verticalSpacer(12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: sizes.heightRatio * 46,
                child: ElevatedButtons(
                  color: colors.primaryColor,
                  text: next,
                  onPressed: () async {
                    if (registrationFormKey.currentState!.validate()) {
                      context.read<RegisterDetailPageBloc>().add(
                            RegisterDetailPageLoading(),
                          );
                      context.read<RegisterDetailPageBloc>().add(
                            Register(
                              passport: emirateIDController.text,
                              firstName: firstNameController.text,
                              dialCode: widget.phoneCode,
                              password: widget.password,
                              email: widget.email,
                              lastName: lastNameController.text,
                              birth: '',
                              emiratesID: emirateIDController.text,
                              phone: widget.phoneNumber,
                            ),
                          );
                    }
                  },
                  textColor: colors.white,
                  isLoading: state.status == RegisterDetailPageStatus.loading
                      ? true
                      : false,
                ),
              ),
              SizedBox(
                height: verticalValue(24),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        switch (state.status) {
          case RegisterDetailPageStatus.init:
            break;
          case RegisterDetailPageStatus.loading:
            break;
          case RegisterDetailPageStatus.loaded:
            break;
          case RegisterDetailPageStatus.detailPageError:
            showToast(
              message: state.errorMessage,
              context: context,
              color: colors.redShade2,
            );
            break;
          case RegisterDetailPageStatus.navigateToDashboard:
            // widget.onTap(
            //   firstNameController.text,
            //   lastNameController.text,
            //   state.selectedFilter!,
            //   emirateIDController.text.replaceAll('-', ''),
            //   expiryController.text,
            //   addressController.text,
            //   cityController.text,
            //   state.countryCode,
            //   countryRegionController.text,
            // );
            break;
        }
      },
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
      setState(
        () {
          expiryController.text =
              '${selected.day}-${selected.month}-${selected.year}';
        },
      );
    }
  }
}
