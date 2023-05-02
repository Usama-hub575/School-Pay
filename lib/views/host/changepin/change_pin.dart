import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/pinupdate_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:pinput/pinput.dart';

import '../../../widgets/toast.dart';

class ChangePIN extends StatefulWidget {
  const ChangePIN({Key? key}) : super(key: key);

  @override
  State<ChangePIN> createState() => _ChangePINState();
}

class _ChangePINState extends State<ChangePIN> {
  TextEditingController pinController = TextEditingController();
  final PinUpdateController pinUpdateController =
      Get.put(PinUpdateController());
  final UserController userController = Get.find<UserController>();

  // var variable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if(userController.userResData.value.status == true){
    //   setState(() {
    //     variable = userController.userResData.value;
    //   });
    // }else if(userController.loginResData.value.status == true){
    //   setState(() {
    //     variable = userController.loginResData.value;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 129.h,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24.r))),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25.h),
                          child: Container(
                            height: 44.h,
                            width: 44.w,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2.0,
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 20.sp,
                                color: PayNestTheme.blueAccent,
                              ),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          changePin,
                          style: PayNestTheme.title20white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          const Text(enterPin),
          SizedBox(height: 10.h),
          Center(
            child: Form(
              key: Utils.pinFormKey,
              child: Padding(
                padding: EdgeInsets.only(top: 48.h, bottom: 36.h),
                child: Pinput(
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusPinTheme,
                  followingPinTheme: followingPinTheme,
                  validator: (s) {
                    // return s == '2222' ? null : 'Pin is incorrect';
                    return s!.isEmpty
                        ? 'Enter Pin'
                        : s.length < 4
                            ? '4 Digit Pin '
                            : null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
            ),
          ),
          const Spacer(),
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
                    // Navigator.pushNamed(context, '/DashboardPage');
                    if (Utils.pinFormKey.currentState!.validate()) {
                      print('validated');
                      await pinUpdateController.hitUpdatePin(pinController.text,
                          userController.userResData.value.parent!.id);
                      if (pinUpdateController.pinData.value.status) {
                        pinController.clear();
                        showToast(
                            context: context,
                            message: 'Pin Updated',
                            color: PayNestTheme.paidGreen);

                        Navigator.pop(context);
                      }
                    } else {
                      pinController.clear();
                      print('Invalidated');
                      showToast(
                          context: context,
                          message: 'Some error occurred',
                          color: PayNestTheme.red);
                    }
                  },
                  child: !pinUpdateController.isLoading.value
                      ? Text(
                          userController.userResData.value.parent!.pin == null
                              ? create
                              : confirm,
                          style: PayNestTheme.subtitle16white,
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: PayNestTheme.colorWhite,
                          backgroundColor: PayNestTheme.blueAccent,
                        )),
                  // label:
                ),
              )),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: PayNestTheme.primaryColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.lineColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: PayNestTheme.primaryColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.blueAccent),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  final followingPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: PayNestTheme.primaryColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.primaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
