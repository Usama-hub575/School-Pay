import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/passwordreset_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  PasswordResetController resetController = Get.put(PasswordResetController());
  final UserController userController = Get.find<UserController>();

  // final FocusNode inputFocusNode = FocusNode();



  bool isObscure = true;
  bool isObscurenew = true;
  bool isObscurere = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: SizedBox(
           height: 1.sh,
           child: Column(
             children: [
               Container(
                 height: 129.h,
                 decoration: BoxDecoration(
                     color: PayNestTheme.primaryColor,
                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
                 ),
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
                                 height : 44.h,
                                 width : 44.w,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(12.r)
                                 ),
                                 child: IconButton(
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                   icon: Icon(Icons.arrow_back,size: 20.sp,color: PayNestTheme.blueAccent,),
                                   // child: Text(""),
                                 ),
                               ),
                             ),
                             Text(chgPassword,style: PayNestTheme.title20white,),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.h),
                 child: Form(
                   key: Utils.changePasswordFormKey,
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(bottom: 17.h),
                         child: TextFormField(
                           controller: oldPassController,
                           obscureText: isObscure,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (value){
                             if(value!.isEmpty){
                               return "Required";
                             }else{
                               return null;
                             }
                           },
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                 borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                             labelText: oldPassword,
                             // labelStyle: CustomizedTheme.b_W400_12,
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                               borderSide: BorderSide(color: Colors.black),
                             ),
                             suffixIcon: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         isObscure = !isObscure;
                                       });
                                     },
                                     child: Text(isObscure ? show : hide,style: PayNestTheme.h2_14blueAccent)
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(bottom: 17.h),
                         child: TextFormField(
                           obscureText: isObscurenew,
                           controller: newPassController,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (value){
                             if(value!.length < 6 ){
                               return "6 Characters";
                             }else if(value.isEmpty){
                               return "Required";
                             }else{
                               return null;
                             }
                           },
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                 borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                             labelText: newPassword,
                             // labelStyle: CustomizedTheme.b_W400_12,
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                               borderSide: BorderSide(color: Colors.black),
                             ),
                             suffixIcon: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         isObscurenew = !isObscurenew;
                                       });
                                     },
                                     child: Text(isObscurenew ? show : hide,style: PayNestTheme.h2_14blueAccent)
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(bottom: 17.h),
                         child: TextFormField(
                           controller: rePassController,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (value){
                             if(value!.isNotEmpty && value != newPassController.text){
                               return "Password does not match";
                             }else if(value.isEmpty){
                               return "Required";
                             }
                             return null;
                           },
                           obscureText: isObscurere,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                 borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                             labelText: confirmpassword,
                             // labelStyle: CustomizedTheme.b_W400_12,
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                               borderSide: BorderSide(color: Colors.black),
                             ),
                             suffixIcon: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         isObscurere = !isObscurere;
                                       });
                                     },
                                     child: Text(isObscurere ? show : hide,style: PayNestTheme.h2_14blueAccent)
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Spacer(),
               Obx(()=>SizedBox(
                 height: 60.h,
                 width: 326.w,
                 child: TextButton(
                   style: TextButton.styleFrom(
                     backgroundColor:PayNestTheme.blueAccent,
                     elevation: 0,
                     // side: BorderSide(width:1, color:Colors.white),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                   ),
                   onPressed: () async {
                     if(Utils.changePasswordFormKey.currentState!.validate()){
                       await resetController.hitResetPassword(userController.userResData.value.parent!.id.toString(), oldPassController.text, newPassController.text);
                       if(resetController.resetPassData.value.status == true){
                         oldPassController.clear();
                         newPassController.clear();
                         rePassController.clear();
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                             // resetController.resetPassData.value.message.toString()
                           "Password Reset Successfully"
                         ),
                           backgroundColor: Colors.green,));
                         Navigator.pop(context);
                       }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resetController.resetPassData.value.message.toString()),backgroundColor: Colors.red,));
                       }
                     }
                     // Navigator.pushNamed(context, '/DashboardPage');
                   },
                   child: !resetController.isLoading.value ? Text(submit,style: PayNestTheme.subtitle16white,) :Center(child: CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,color: PayNestTheme.blueAccent,)),
                   // label:
                 ),
               )),
               SizedBox(height: 50.h,),
             ],
           ),
         ),
       ),
    );
  }
}
