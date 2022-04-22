import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/pinupdate_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:pinput/pinput.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  TextEditingController pinController = TextEditingController();
  final PinUpdateController pinUpdateController = Get.put(PinUpdateController());
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BlueBackButton(context: context,),
                SizedBox(width: 20.w,),
                Text(register,style: PayNestTheme.title20primaryColor),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/DashboardPage',(Route<dynamic> route) => false);
                  },
                  child: Text(skip,style: PayNestTheme.h2_14blueAccent,),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h,bottom: 6.h),
              child: Text(createPIN,style: PayNestTheme.title22black,),
            ),
            Text(thePINwill,style: PayNestTheme.h2_14textGrey,),
            SizedBox(height: 48.h,),
            Form(
              key: Utils.regPinFormKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 48.h,bottom: 36.h),
                  child: Pinput(
                    controller: pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusPinTheme,
                    followingPinTheme: followingPinTheme,
                    validator: (s) {
                      // return s == '2222' ? null : 'Pin is incorrect';
                      return s!.isEmpty ? 'Enter Pin': s.length < 4 ? '4 Digit Pin ' : null;
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60.h,
              width: 326.w,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:Colors.blue,
                  elevation: 0,
                  // side: BorderSide(width:1, color:Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  if(Utils.regPinFormKey.currentState!.validate()){
                    print('validated');
                    await pinUpdateController.hitUpdatePin(pinController.text,userController.userResData.value.parent!.id);
                    if(pinUpdateController.pinData.value.status){
                      pinController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pinUpdateController.pinData.value.message.toString()),backgroundColor: Colors.green));
                      Navigator.pushNamedAndRemoveUntil(context, '/DashboardPage',(Route<dynamic> route) => false);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to create PIN"),backgroundColor: Colors.red));
                    }
                  }
                },
                child: Text(create,style: PayNestTheme.subtitle16white,),
                // label:
              ),
            ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(fontSize: 20.sp, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(fontSize: 20.sp, color: PayNestTheme.primaryColor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.blueAccent),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  final followingPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(fontSize: 20.sp, color: PayNestTheme.primaryColor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.primaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
