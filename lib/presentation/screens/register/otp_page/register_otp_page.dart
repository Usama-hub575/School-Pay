import 'package:paynest_flutter_app/export.dart';

class RegisterOtpPage extends StatefulWidget {
  const RegisterOtpPage({
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
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage> {
  bool loading = false;
  bool completeCode = false;
  TextEditingController otpController = TextEditingController();
  // SendOTPController sendOTPController = Get.put(SendOTPController());
  // VerifyOTPController verifyOTPController = Get.put(VerifyOTPController());
  int _start = 60;
  bool timeUpFlag = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      //startTimer();
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
              style: TextStyles().extraBold.copyWith(
                    color: AppColors().black,
                    fontSize: sizes.fontRatio * 18,
                  ),
            ),
            Expanded(
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
                        style: TextStyles().regular.copyWith(
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
                          textStyle: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: AppColors().black,
                              ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors().black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          width: sizes.widthRatio * 80,
                          height: sizes.heightRatio * 50,
                        ),
                        controller: otpController,
                        validator: (s) {
                          if (s!.length < 4) {
                            setState(() {
                              completeCode = false;
                            });
                          }
                          return s.isEmpty ? "Enter Code" : '';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        keyboardType: TextInputType.phone,
                        showCursor: true,
                        onCompleted: (pin) {
                          setState(
                            () {
                              completeCode = true;
                            },
                          );
                        },
                      ),
                    ),
                    verticalSpacer(50),
                    !timeUpFlag
                        ? Text("Try it after $_start seconds")
                        : InkWellWidget(
                            onTap: () {},
                            // onTap: () => startTimer(),
                            child: Text(
                              resend,
                              style: TextStyles().bold.copyWith(
                                    fontSize: sizes.fontRatio * 16,
                                    color: AppColors().primaryColor,
                                  ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //       backgroundColor:
            //           completeCode ? AppColors().primaryColor : Colors.grey,
            //       elevation: 0,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       padding: EdgeInsets.symmetric(
            //         vertical: verticalValue(16),
            //       )),
            //   onPressed: () async {
            //     if (otpController.length == 4) {
            //       await verifyOTPController.hitVerifyOTP(
            //           widget.phoneCode + widget.phoneNumber,
            //           otpController.text);
            //       if (verifyOTPController.isSuccess.value) {
            //         verifyOTPController.otpVerifyData.update((val) {
            //           val!.type = null;
            //         });
            //         otpController.clear();
            //         setState(() {
            //           completeCode = false;
            //         });
            //         widget.onSuccess();
            //       } else {
            //         showToast(
            //             message: 'Entered OTP is wrong',
            //             context: context,
            //             color: AppColors().red);
            //         // otpController.clear();
            //       }
            //     }
            //   },
            //   child: Row(
            //     children: [
            //       const Spacer(),
            //       Text(
            //         next,
            //         style: TextStyles().semiBold.copyWith(
            //           fontSize: sizes.fontRatio * 14,
            //         ),
            //       ),
            //       const Spacer(),
            //       !verifyOTPController.isLoading.value
            //           ? const SizedBox.shrink()
            //           : SizedBox(
            //               height: sizes.heightRatio * 16,
            //               width: sizes.widthRatio * 16,
            //               child: CircularProgressIndicator(
            //                 backgroundColor: AppColors().white,
            //                 color: AppColors().primaryColor,
            //                 strokeWidth: 2,
            //               ),
            //             ),
            //       horizontalSpacer(16),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

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

  // void startTimer() {
  //   sendOTPController.hitSendOTP(
  //       widget.phoneCode, widget.phoneNumber, widget.email);
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
}
