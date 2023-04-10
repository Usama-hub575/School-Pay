import 'package:paynest_flutter_app/export.dart';

class RegisterMainPage extends StatefulWidget {
  const RegisterMainPage({
    Key? key,
    required this.onButtonTap,
    required this.onNextTap,
  }) : super(key: key);

  final Function(
    String email,
    String password,
    String phoneCode,
    String phoneNumber,
  )? onNextTap;

  final Function(bool value) onButtonTap;

  @override
  State<RegisterMainPage> createState() => _RegisterMainPageState();
}

class _RegisterMainPageState extends State<RegisterMainPage> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController phoneCodeController = TextEditingController(
    text: '+971',
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: key,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalValue(30),
              ),
              child: Text(
                pleaseEnterYourPhoneNumberAndEmailId,
                style: textStyles.extraBold.copyWith(
                  fontSize: sizes.fontRatio * 18,
                  color: colors.black,
                ),
              ),
            ),
            BlocConsumer<RegisterMainPageBloc, RegisterMainPageState>(
              builder: (context, state) {
                return Expanded(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        NumberField(
                          enable: state.status == RegisterMainPageStatus.loading
                              ? true
                              : false,
                          phoneCodeController: phoneCodeController,
                          textController: phoneController,
                          formKey: formKey,
                        ),
                        verticalSpacer(12),
                        CommonTextField(
                          readOnly:
                              state.status == RegisterMainPageStatus.loading
                                  ? true
                                  : false,
                          onValidate: (value) {
                            return null;
                          },
                          controller: emailController,
                          labelText: email,
                          validatorText: pleaseEnterEmail,
                          obscureText: false,
                        ),
                        verticalSpacer(12),
                        CommonTextField(
                          readOnly:
                              state.status == RegisterMainPageStatus.loading
                                  ? true
                                  : false,
                          onValidate: (value) {},
                          controller: createPasswordController,
                          labelText: createPassword,
                          validatorText: pleaseCreatePassword,
                          obscureText: state.obscurePassword,
                          icon: IconButton(
                            icon: SvgPicture.asset(
                              assets.icEyeCrossed,
                              color: colors.primaryColor,
                            ),
                            onPressed: () {
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterToggle(
                                      toggleStatus: "password",
                                    ),
                                  );
                            },
                          ),
                        ),
                        verticalSpacer(12),
                        CommonTextField(
                          readOnly:
                              state.status == RegisterMainPageStatus.loading
                                  ? true
                                  : false,
                          onValidate: (value) {
                            if (createPasswordController.text !=
                                confirmPasswordController.text) {
                              return passwordNotMatched;
                            } else {
                              return null;
                            }
                          },
                          controller: confirmPasswordController,
                          labelText: confirmPassword,
                          validatorText: pleaseConfirmPassword,
                          obscureText: state.obscureConfirmPassword,
                          icon: IconButton(
                            icon: SvgPicture.asset(
                              assets.icEyeCrossed,
                              color: colors.primaryColor,
                            ),
                            onPressed: () {
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterToggle(
                                      toggleStatus: "confirmPassword",
                                    ),
                                  );
                            },
                          ),
                        ),
                        verticalSpacer(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: state.terms,
                              focusColor: colors.primaryColor,
                              activeColor: colors.primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              onChanged: (newValue) {
                                context.read<RegisterMainPageBloc>().add(
                                      CheckBox(),
                                    );
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: iAccept,
                                    style: textStyles.bold.copyWith(
                                      color: colors.black,
                                      fontSize: sizes.fontRatio * 14,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '  ',
                                  ),
                                  TextSpan(
                                    text: termsAndConditions,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        launchUrlString(
                                          termsAndConditionsURL,
                                        );
                                        setState(() {});
                                      },
                                    style: textStyles.bold.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: sizes.fontRatio * 14,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        verticalSpacer(40),
                        SizedBox(
                          width: double.infinity,
                          height: sizes.heightRatio * 46,
                          child: ElevatedButtons(
                            textColor: colors.white,
                            isLoading:
                                state.status == RegisterMainPageStatus.loading
                                    ? true
                                    : false,
                            color: colors.primaryColor,
                            text: next,
                            onPressed: state.status ==
                                    RegisterMainPageStatus.loading
                                ? () {}
                                : () async {
                                    if (formKey.currentState!.validate() &&
                                        state.terms &&
                                        phoneController.text.isNotEmpty) {
                                      widget.onButtonTap(true);
                                      context.read<RegisterMainPageBloc>().add(
                                            RegisterMainPageLoading(),
                                          );
                                      context.read<RegisterMainPageBloc>().add(
                                            SendOTP(
                                              email: emailController.text,
                                              userPhoneNumber:
                                                  phoneController.text,
                                              dialCode:
                                                  phoneCodeController.text,
                                            ),
                                          );
                                      widget.onButtonTap(false);
                                    } else if (state.terms) {
                                      showToast(
                                        message: phoneFieldCannotBeEmpty,
                                        context: context,
                                        color: colors.redShade2,
                                      );
                                    } else if (formKey.currentState!
                                            .validate() &&
                                        phoneController.text.isNotEmpty) {
                                      showToast(
                                        message: acceptTermsAndCondition,
                                        context: context,
                                        color: colors.redShade2,
                                      );
                                    } else {
                                      showToast(
                                        message: fieldsCannotBeEmpty,
                                        context: context,
                                        color: colors.redShade2,
                                      );
                                    }
                                  },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(29),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: verticalValue(1),
                                width: horizontalValue(129),
                                decoration: BoxDecoration(
                                  color: colors.primaryColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: Text(
                                  or,
                                  style: textStyles.bold.copyWith(
                                    color: colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: verticalValue(1),
                                width: horizontalValue(129),
                                decoration: BoxDecoration(
                                  color: colors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: sizes.heightRatio * 50,
                          width: sizes.widthRatio * 326,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              assets.icGoogle,
                            ),
                            label: Text(
                              google,
                              style: textStyles.bold.copyWith(
                                color: colors.black,
                                fontSize: sizes.fontRatio * 16,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              // primary: MyTheme.sharpGreen,
                              elevation: 0,
                              // side: BorderSide(width:1, color:Colors.white),
                              side: BorderSide(
                                color: colors.primaryColor,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: verticalValue(16),
                        ),
                        SizedBox(
                          height: sizes.heightRatio * 50,
                          width: sizes.widthRatio * 326,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              assets.icFacebook,
                            ),
                            label: Text(
                              facebook,
                              style: textStyles.bold.copyWith(
                                color: colors.black,
                                fontSize: sizes.fontRatio * 16,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              // primary: MyTheme.sharpGreen,
                              elevation: 0,
                              // side: BorderSide(width:1, color:Colors.white),
                              side: BorderSide(
                                color: colors.primaryColor,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              listener: (context, state) {
                switch (state.status) {
                  case RegisterMainPageStatus.init:
                    // TODO: Handle this case.
                    break;
                  case RegisterMainPageStatus.loading:
                    Center(
                      child: SizedBox(
                        width: sizes.heightRatio * 20,
                        height: sizes.heightRatio * 20,
                        child: CircularProgressIndicator(
                          backgroundColor: colors.white,
                          color: colors.blueAccent,
                        ),
                      ),
                    );
                    break;
                  case RegisterMainPageStatus.navigateToOTPPage:
                    widget.onNextTap!(
                      emailController.text,
                      createPasswordController.text,
                      phoneCodeController.text,
                      phoneController.text,
                    );
                    break;
                  case RegisterMainPageStatus.mainPageError:
                    showToast(
                      message: state.mainPageErrorMessage,
                      context: context,
                      color: colors.redShade2,
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
