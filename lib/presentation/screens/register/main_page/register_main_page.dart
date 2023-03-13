import 'package:paynest_flutter_app/export.dart';

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
  )? onNextTap;

  @override
  State<RegisterMainPage> createState() => _RegisterMainPageState();
}

class _RegisterMainPageState extends State<RegisterMainPage> {
  bool isObscure = true;
  bool cPassword = true;
  var flag, countryCode;

  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController(
    text: "+971",
  );
  TextEditingController emailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // SendOTPController sendOTPController = Get.put(SendOTPController());

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BlocConsumer<RegisterMainPageBloc, RegisterMainPageBaseState>(
            builder: (context, state) {
              return Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      NumberField(
                        phoneCodeController: phoneCodeController,
                        textController: phoneController,
                      ),
                      verticalSpacer(12),
                      CommonTextField(
                        onChange: (value) {
                          return null;
                        },
                        controller: emailController,
                        labelText: email,
                        validatorText: pleaseEnterEmail,
                        obscureText: false,
                        icon: null,
                      ),
                      verticalSpacer(12),
                      CommonTextField(
                        onChange: (value) {},
                        controller: createPasswordController,
                        labelText: createPassword,
                        validatorText: pleaseCreatePassword,
                        obscureText:
                            state.status == RegisterMainPageStatus.password
                                ? state.isObscure
                                : false,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets().icEyeCrossed,
                            color: AppColors().primaryColor,
                          ),
                          onPressed: () {
                            context.read<RegisterMainPageBloc>().add(
                                  RegisterToggle(
                                    toggleStatus:
                                        RegisterMainPageStatus.password,
                                  ),
                                );
                          },
                        ),
                      ),
                      verticalSpacer(12),
                      CommonTextField(
                        onChange: (value) {
                          if (createPasswordController.text !=
                              confirmPasswordController.text) {
                            return passwordNotMatched;
                          } else {
                            return '';
                          }
                        },
                        controller: confirmPasswordController,
                        labelText: confirmPassword,
                        validatorText: pleaseConfirmPassword,
                        obscureText: state.status ==
                                RegisterMainPageStatus.confirmPassword
                            ? state.isObscure
                            : false,
                        icon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets().icEyeCrossed,
                            color: AppColors().primaryColor,
                          ),
                          onPressed: () {
                            context.read<RegisterMainPageBloc>().add(
                                  RegisterToggle(
                                    toggleStatus:
                                        RegisterMainPageStatus.confirmPassword,
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
                          color: AppColors().primaryColor,
                          text: next,
                          onPressed: () async {
                            if (formKey.currentState!.validate() &&
                                state.terms == true &&
                                phoneController.text.isNotEmpty) {
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterLoading(),
                                  );
                              // await sendOTPController.hitSendOTP(
                              //   emailController.text,
                              //   phoneController.text,
                              //   phoneCodeController.text,
                              // );
                              context.read<RegisterMainPageBloc>().add(
                                    RegisterLoading(),
                                  );
                              // if (sendOTPController.status.value) {
                              //   //hit otp
                              //   Future.delayed(const Duration(seconds: 2)).then(
                              //     (value) => {
                              //       widget.onNextTap(
                              //         emailController.text,
                              //         createPasswordController.text,
                              //         phoneCodeController.text,
                              //         phoneController.text,
                              //       ),
                              //     },
                              //   );
                              // } else if (!sendOTPController.status.value) {
                              //   ScaffoldMessenger.of(key.currentState!.context)
                              //       .showSnackBar(
                              //     SnackBar(
                              //       duration: const Duration(seconds: 1),
                              //       backgroundColor: Colors.red,
                              //       padding: EdgeInsets.symmetric(
                              //         vertical: verticalValue(16),
                              //       ),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(16),
                              //       ),
                              //       content: Text(
                              //         sendOTPController.errorMessage.value,
                              //         textAlign: TextAlign.center,
                              //       ),
                              //       behavior: SnackBarBehavior.floating,
                              //     ),
                              //   );
                              // }
                            } else {
                              showToast(
                                message: phoneFieldCannotBeEmpty,
                                context: context,
                                color: AppColors().redShade2,
                              );
                            }
                          },
                          textColor: AppColors().white,
                          isLoading:
                              state.status == RegisterMainPageStatus.loading
                                  ? true
                                  : false,
                        ),
                      )
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 29.h),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         height: 1.h,
                      //         width: 129.w,
                      //         decoration: BoxDecoration(
                      //           color: AppColors().primaryColor,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //         child: Text(
                      //           or,
                      //           style: AppColors().h2_14textGrey.copyWith(
                      //             color: AppColors().black,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         height: 1.h,
                      //         width: 129.w,
                      //         decoration: BoxDecoration(
                      //           color: AppColors().primaryColor,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 50.h,
                      //   width: 326.w,
                      //   child: OutlinedButton.icon(
                      //     onPressed: () {},
                      //     icon: Image.asset(googleicon),
                      //     label: Text(
                      //       google,
                      //       style: AppColors().title_3_16black,
                      //     ),
                      //     style: OutlinedButton.styleFrom(
                      //       // primary: MyTheme.sharpGreen,
                      //       elevation: 0,
                      //       // side: BorderSide(width:1, color:Colors.white),
                      //       side: BorderSide(
                      //           color: AppColors().primaryColor, width: 1.sp),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(
                      //           15,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 16.h,
                      // ),
                      // SizedBox(
                      //   height: 50.h,
                      //   width: 326.w,
                      //   child: OutlinedButton.icon(
                      //     onPressed: () {},
                      //     icon: Image.asset(facebookicon),
                      //     label: Text(
                      //       facebook,
                      //       style: AppColors().title_3_16black,
                      //     ),
                      //     style: OutlinedButton.styleFrom(
                      //       // primary: MyTheme.sharpGreen,
                      //       elevation: 0,
                      //       // side: BorderSide(width:1, color:Colors.white),
                      //       side: BorderSide(
                      //           color: AppColors().primaryColor, width: 1.sp),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                  // TODO: Handle this case.
                  break;
                case RegisterMainPageStatus.confirmPassword:
                  // TODO: Handle this case.
                  break;
                case RegisterMainPageStatus.password:
                  // TODO: Handle this case.
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
