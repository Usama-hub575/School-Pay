import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPage extends StatefulWidget {
  const RegisterOTPPage({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.phoneCode,
    required this.onSuccess,
  }) : super(key: key);

  final String phoneCode;
  final String phoneNumber;
  final String email;
  final String password;
  final Function onSuccess;

  @override
  State<RegisterOTPPage> createState() => _RegisterOTPPageState();
}

class _RegisterOTPPageState extends State<RegisterOTPPage> {
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<RegisterOTPPageBloc>().add(
            StartTimer(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(16),
            Text(
              confirmCode,
              style: textStyles.extraBold.copyWith(
                color: colors.black,
                fontSize: sizes.fontRatio * 18,
              ),
            ),
            BlocConsumer<RegisterOTPPageBloc, RegisterOTPPageState>(
              builder: (context, state) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(16),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(12),
                          ),
                          child: Text(
                            'The Code Has Been sent to ${widget.phoneCode + widget.phoneNumber} & ${widget.email}. Please Enter The Code Below.',
                            style: textStyles.regular.copyWith(
                              fontSize: sizes.fontRatio * 12,
                            ),
                          ),
                        ),
                        verticalSpacer(80),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Pinput(
                            length: 4,
                            defaultPinTheme: PinTheme(
                              textStyle: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.black,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              width: sizes.widthRatio * 80,
                              height: sizes.heightRatio * 50,
                            ),
                            controller: otpController,
                            validator: (value) {
                              if (value!.length < 4) {
                                context.read<RegisterOTPPageBloc>().add(
                                      CheckCode(
                                        isCodeComplete: false,
                                      ),
                                    );
                              }
                              return value.isEmpty ? "Enter Code" : '';
                            },
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            keyboardType: TextInputType.phone,
                            showCursor: true,
                            onCompleted: (pin) {
                              context.read<RegisterOTPPageBloc>().add(
                                    CheckCode(
                                      isCodeComplete: true,
                                    ),
                                  );
                            },
                          ),
                        ),
                        verticalSpacer(50),
                        !state.timeUpFlag
                            ? Text(
                                "Try it after ${state.start} seconds",
                              )
                            : InkWellWidget(
                                onTap: () {
                                  context.read<RegisterMainPageBloc>().add(
                                        SendOTP(
                                          userPhoneNumber: widget.phoneNumber,
                                          dialCode: widget.phoneCode,
                                          email: widget.email,
                                        ),
                                      );
                                  context.read<RegisterOTPPageBloc>().add(
                                        StartTimer(),
                                      );
                                },
                                child: Text(
                                  resend,
                                  style: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 16,
                                    color: colors.primaryColor,
                                  ),
                                ),
                              ),
                        verticalSpacer(40),
                        SizedBox(
                          width: double.infinity,
                          height: sizes.heightRatio * 46,
                          child: ElevatedButtons(
                            color: colors.primaryColor,
                            text: next,
                            onPressed: () async {
                              if (otpController.length == 4) {
                                context.read<RegisterOTPPageBloc>().add(
                                      OTPLoading(),
                                    );
                                context.read<RegisterOTPPageBloc>().add(
                                      VerifyOTP(
                                        otpCode: otpController.text,
                                        phoneNumber: widget.phoneCode +
                                            widget.phoneNumber,
                                      ),
                                    );
                              }
                            },
                            textColor: colors.white,
                            isLoading:
                                state.status == RegisterOTPPageStatus.loading
                                    ? true
                                    : false,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              listener: (context, state) {
                switch (state.status) {
                  case RegisterOTPPageStatus.init:
                    break;
                  case RegisterOTPPageStatus.loading:
                    // TODO: Handle this case.
                    break;
                  case RegisterOTPPageStatus.loaded:
                    // TODO: Handle this case.
                    break;
                  case RegisterOTPPageStatus.navigateToDetailPage:
                    widget.onSuccess();
                    otpController.clear();
                    break;
                  case RegisterOTPPageStatus.otpPageError:
                    showToast(
                      message: state.otpErrorMessage ?? enteredOTPIsWrong,
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

  // void startTimer() {
  //   sendOTPController.hitSendOTP(
  //     widget.phoneCode,
  //     widget.phoneNumber,
  //     widget.email,
  //   );
  //   setState(() {
  //     timeUpFlag = false;
  //     _start = 60;
  //   });
  //   const oneSec = Duration(seconds: 1);
  //
  //   Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start < 2) {
  //         setState(() {
  //           timeUpFlag = true;
  //           timer.cancel();
  //         });
  //       } else {
  //         if (mounted) {
  //           setState(() {
  //             _start--;
  //           });
  //         }
  //       }
  //     },
  //   );
  // }

  final defaultPinTheme = PinTheme(
    width: horizontalValue(60),
    height: verticalValue(70),
    textStyle: TextStyle(
        fontSize: sizes.fontRatio * 20,
        color: const Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
