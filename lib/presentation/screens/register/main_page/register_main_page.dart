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
                style: TextStyles().extraBold.copyWith(
                      fontSize: sizes.fontRatio * 18,
                      color: AppColors().black,
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
                          onValidate: (value) {
                            return null;
                          },
                          controller: createPasswordController,
                          labelText: createPassword,
                          validatorText: pleaseCreatePassword,
                          obscureText: state.obscurePassword,
                          icon: IconButton(
                            icon: SvgPicture.asset(
                              AppAssets().icEyeCrossed,
                              color: AppColors().primaryColor,
                            ),
                            onPressed: () {
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterToggle(
                                      toggleStatus: "password",
                                      obscure: !state.obscurePassword,
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
                              AppAssets().icEyeCrossed,
                              color: AppColors().primaryColor,
                            ),
                            onPressed: () {
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterToggle(
                                      toggleStatus: "confirmPassword",
                                      obscure: !state.obscureConfirmPassword,
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
                              focusColor: AppColors().primaryColor,
                              activeColor: AppColors().primaryColor,
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
                                    style: TextStyles().bold.copyWith(
                                          color: AppColors().black,
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
                                    style: TextStyles().bold.copyWith(
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
                            textColor: AppColors().white,
                            isLoading:
                                state.status == RegisterMainPageStatus.loading
                                    ? true
                                    : false,
                            color: AppColors().primaryColor,
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
                                        color: AppColors().redShade2,
                                      );
                                    } else if (formKey.currentState!
                                            .validate() &&
                                        phoneController.text.isNotEmpty) {
                                      showToast(
                                        message: acceptTermsAndCondition,
                                        context: context,
                                        color: AppColors().redShade2,
                                      );
                                    } else {
                                      showToast(
                                        message: fieldsCannotBeEmpty,
                                        context: context,
                                        color: AppColors().redShade2,
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
                                  color: AppColors().primaryColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: Text(
                                  or,
                                  style: TextStyles().bold.copyWith(
                                        color: AppColors().black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Container(
                                height: verticalValue(1),
                                width: horizontalValue(129),
                                decoration: BoxDecoration(
                                  color: AppColors().primaryColor,
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
                              AppAssets().icGoogle,
                            ),
                            label: Text(
                              google,
                              style: TextStyles().bold.copyWith(
                                    color: AppColors().black,
                                    fontSize: sizes.fontRatio * 16,
                                  ),
                            ),
                            style: OutlinedButton.styleFrom(
                              // primary: MyTheme.sharpGreen,
                              elevation: 0,
                              // side: BorderSide(width:1, color:Colors.white),
                              side: BorderSide(
                                color: AppColors().primaryColor,
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
                              AppAssets().icFacebook,
                            ),
                            label: Text(
                              facebook,
                              style: TextStyles().bold.copyWith(
                                    color: AppColors().black,
                                    fontSize: sizes.fontRatio * 16,
                                  ),
                            ),
                            style: OutlinedButton.styleFrom(
                              // primary: MyTheme.sharpGreen,
                              elevation: 0,
                              // side: BorderSide(width:1, color:Colors.white),
                              side: BorderSide(
                                color: AppColors().primaryColor,
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
                          backgroundColor: PayNestTheme.colorWhite,
                          color: PayNestTheme.blueAccent,
                        ),
                      ),
                    );
                    break;
                  case RegisterMainPageStatus.confirmPassword:
                    // TODO: Handle this case.
                    break;
                  case RegisterMainPageStatus.password:
                    // TODO: Handle this case.
                    break;
                  case RegisterMainPageStatus.loaded:
                    Text(
                      next,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.colorWhite,
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
                    context.read<RegisterMainPageBloc>().add(
                          Loaded(),
                        );
                    break;
                  case RegisterMainPageStatus.mainPageError:
                    context.read<RegisterMainPageBloc>().add(
                          Loaded(),
                        );
                    ScaffoldMessenger.of(key.currentState!.context)
                        .showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(16),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        content: Text(
                          state.mainPageErrorMessage,
                          textAlign: TextAlign.center,
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
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
