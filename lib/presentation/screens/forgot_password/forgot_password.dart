import 'package:paynest_flutter_app/export.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();

  // UserController userController = Get.put(UserController());
  TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'forgotPassword');

  // RegisterController registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                AppBarBackButton(
                  iconColor: colors.white,
                  buttonColor: colors.primaryColor,
                ),
                const Spacer(),
                Image.asset(
                  assets.welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                const Spacer(),
              ],
            ),
            BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Form(
                        key: forgotPasswordKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacer(80),
                            Text(
                              forgotPassword,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 20,
                                color: colors.primaryColor,
                              ),
                            ),
                            verticalSpacer(16),
                            CommonTextField(
                              validatorText: pleaseEnterEmail,
                              readOnly:
                                  state.status == ForgotPasswordStatus.loading
                                      ? true
                                      : false,
                              onValidate: (value) {},
                              controller: emailController,
                              labelText: email,
                              obscureText: false,
                            ),
                            // TextFormField(
                            //   controller: emailController,
                            //   decoration: InputDecoration(
                            //     border: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: colors.textGrey.withOpacity(
                            //           0.5,
                            //         ),
                            //       ),
                            //     ),
                            //     focusedBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: colors.textGrey.withOpacity(0.5),
                            //       ),
                            //     ),
                            //     labelText: email,
                            //     labelStyle: textStyles.bold.copyWith(
                            //       fontSize: sizes.fontRatio * 12,
                            //       color: colors.primaryColor,
                            //     ),
                            //     enabledBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: colors.textGrey.withOpacity(0.5),
                            //       ),
                            //     ),
                            //     errorBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: colors.textGrey.withOpacity(0.5),
                            //       ),
                            //     ),
                            //     disabledBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: colors.textGrey.withOpacity(0.5),
                            //       ),
                            //     ),
                            //   ),
                            //   autovalidateMode:
                            //       AutovalidateMode.onUserInteraction,
                            //   validator: (value) {
                            //     if (value!.trim().isEmpty) {
                            //       return pleaseEnterEmail;
                            //     }
                            //     if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            //       return invalidEmail;
                            //     }
                            //     return null;
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      verticalSpacer(60),
                      SizedBox(
                        width: double.infinity,
                        height: sizes.heightRatio * 46,
                        child: ElevatedButtons(
                          onPressed: () async {
                            if (forgotPasswordKey.currentState!.validate()) {
                              context.read<ForgotPasswordBloc>().add(
                                    ForgotPasswordLoading(),
                                  );
                              context.read<ForgotPasswordBloc>().add(
                                    HitForgotPassword(
                                      email: emailController.text,
                                    ),
                                  );
                              // await registerController
                              //     .hitForgotPassword(emailController.text);
                              // if (registerController
                              //         .forgotPasswordResData.value.status ==
                              //     true) {
                              //   Navigator.of(context).pushNamed(
                              //       '/NewPassword',
                              //       arguments:
                              //           emailController.text.toString());
                              // }
                              // else {
                              //   showToast(
                              //     context: context,
                              //     message: registerController.isFailed.value
                              //         .toString(),
                              //     color: colors.red,
                              //   );
                              // }
                            } else {
                              showToast(
                                context: context,
                                message: emailFieldIsEmpty,
                                color: colors.redShade2,
                              );
                            }
                            // setState(() {
                            //   CustomAlertDialog.baseDialog(
                            //     context: context,
                            //     title: "Success!",
                            //     message:
                            //     "Email Send Successfully",
                            //     showCrossIcon: false,
                            //     buttonAction: () {
                            //       Navigator.of(context).pop();
                            //     },
                            //   );
                            // });
                          },
                          color: colors.primaryColor,
                          text: sendOTP,
                          textColor: colors.white,
                          isLoading:
                              state.status == ForgotPasswordStatus.loading
                                  ? true
                                  : false,
                        ),
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                switch (state.status) {
                  case ForgotPasswordStatus.init:
                    // TODO: Handle this case.
                    break;
                  case ForgotPasswordStatus.navigateToNewPassword:
                    Navigator.pushNamed(
                      context,
                      AppRoutes.navigateToNewPassword,
                      arguments: {
                        'email': emailController.text,
                      },
                    );
                    break;
                  case ForgotPasswordStatus.error:
                    showToast(
                      context: context,
                      message: state.errorMessage,
                      color: colors.redShade2,
                    );
                    break;
                  case ForgotPasswordStatus.loading:
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
