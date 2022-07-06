import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/custom_slider.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_detail_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_main_page.dart';
import 'package:paynest_flutter_app/views/registration_screen/widget/register_otp_page.dart';
import '../../constants/constants.dart';
import '../../model/datamodel/reg1_to_otp.dart';
import '../../res/res.dart';
import '../../theme/theme.dart';
import '../../utils/utils.dart';
import '../../widgets/blue_back_button.dart';
import '../../widgets/spacer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;
  bool terms = false;
  bool isObscure = true;
  var flag, countryCode;
  int _currentIndex = 0;

  TextEditingController phoneController = TextEditingController();
  TextEditingController phCodeController = TextEditingController(text: "+971");
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final pages = [
    const RegisterMainPage(),
    const RegisterOtpPage(),
    const RegisterDetailPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             BlueBackButton(context: context,),
    //             SizedBox(width: 20.w,),
    //             Text(registration,style: PayNestTheme.title20primaryColor,),
    //           ],
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 23.h,bottom: 12.h),
    //           child: Text(pleaseenterdetailbelow,style: PayNestTheme.title22black,),
    //         ),
    //         Text(weuseyourphone,style: PayNestTheme.h2_14textGrey,),
    //         SizedBox(height: 46.h,),
    //         // Scrollable
    //         Expanded(
    //           child: Form(
    //             key : Utils.reg1FormKey,
    //             child: ListView(
    //               shrinkWrap: true,
    //               physics: BouncingScrollPhysics(),
    //               children: [
    //                 Container(
    //                   height: 65.h,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(12.r),
    //                       border: Border.all(
    //                           width: 1.w,
    //                           color: PayNestTheme.dropShadow
    //                       )
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       FittedBox(
    //                         child: CountryCodePicker(
    //                           showDropDownButton: true,
    //                           onChanged: (value) {
    //                             setState(() {
    //                               phCodeController.text = value.toString();
    //                             });
    //                           },
    //                           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
    //                           initialSelection: phCodeController.text,
    //                           // favorite: ['+971','FR'],
    //                           // optional. Shows only country name and flag
    //                           showCountryOnly: false,
    //                           // optional. Shows only country name and flag when popup is closed.
    //                           showOnlyCountryWhenClosed: false,
    //                           // optional. aligns the flag and the Text left
    //                           alignLeft: false,
    //                         ),
    //                       ),
    //                       Expanded(
    //                         child:TextFormField(
    //                           keyboardType: TextInputType.phone,
    //                           controller: phoneController,
    //                           decoration: const InputDecoration(
    //                             hintText: phone,
    //                             border: InputBorder.none,
    //                           ),
    //                           autovalidateMode:AutovalidateMode.onUserInteraction,
    //                           validator: (value) {
    //                             if (!GetUtils.isPhoneNumber(value!)) {
    //                               return "Please enter valid number";
    //                             } else {
    //                               return null;
    //                             }
    //                           },
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(height: 13.h,),
    //
    //                 TextFormField(
    //                   controller: emailController,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
    //                         borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
    //                     labelText: email,
    //                     // labelStyle: CustomizedTheme.b_W400_12,
    //                     focusedBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
    //                       borderSide: BorderSide(color: Colors.black),
    //                     ),
    //                   ),
    //                   autovalidateMode:AutovalidateMode.onUserInteraction,
    //                   validator: (value) {
    //                     if (value!.trim().isEmpty) {
    //                       return 'Required';
    //                     }
    //                     // Check if the entered email has the right format
    //                     if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    //                       return 'Correct email required';
    //                     }
    //                     // Return null if the entered email is valid
    //                     return null;
    //                   },
    //                 ),
    //                 SizedBox(height: 13.h,),
    //                 TextFormField(
    //                   controller: passController,
    //                   obscureText: isObscure,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
    //                         borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
    //                     labelText: password,
    //                     // labelStyle: CustomizedTheme.b_W400_12,
    //                     suffixIcon: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         GestureDetector(
    //                             onTap: (){
    //                               setState(() {
    //                                 isObscure = !isObscure;
    //                               });
    //                             },
    //                             child: Text(isObscure ? show : hide,style: PayNestTheme.h2_14blueAccent)
    //                         ),
    //                       ],
    //                     ),
    //                     focusedBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
    //                       borderSide: BorderSide(color: Colors.black),
    //                     ),
    //                   ),
    //                   autovalidateMode:AutovalidateMode.onUserInteraction,
    //                   validator: (value) {
    //                     if (value!.trim().isEmpty) {
    //                       return 'Required';
    //                     }
    //                     // Check if the entered email has the right format
    //                     if (value.trim().length < 5) {
    //                       return 'Password must not be less than 5';
    //                     }
    //                     // Return null if the entered email is valid
    //                     return null;
    //                   },
    //                 ),
    //                 CheckboxListTile(
    //                   value: terms,
    //                   controlAffinity: ListTileControlAffinity.leading,
    //                   title: Row(
    //                     children: [
    //                       Text('I accept',style: PayNestTheme.small_14black,),
    //                       GestureDetector(
    //                           onTap: (){
    //
    //                           },
    //                           child: Text(' Terms & Conditions.',style: PayNestTheme.small_14blueAccent,)
    //                       ),
    //                     ],
    //                   ),
    //                   contentPadding: EdgeInsets.all(0),
    //                   onChanged: (newValue) {
    //                     setState(() {
    //                       terms = !terms;
    //                     });
    //                   },
    //                   activeColor: PayNestTheme.blueAccent,
    //                 ),
    //                 SizedBox(height: 52.h,),
    //
    //                 SizedBox(
    //                   height: 60.h,
    //                   width: 326.w,
    //                   child: TextButton(
    //                     style: TextButton.styleFrom(
    //                       backgroundColor:PayNestTheme.blueAccent,
    //                       elevation: 0,
    //                       // side: BorderSide(width:1, color:Colors.white),
    //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //                     ),
    //                     onPressed: (){
    //                       if(Utils.reg1FormKey.currentState!.validate() && terms == true){
    //                         setState(() {
    //                           loading = true;
    //                         });
    //                         Future.delayed(
    //                             Duration(seconds: 1),(){
    //                           setState(() {
    //                             loading = false;
    //                           });
    //                           Navigator.pushNamed(context, '/OTPPage',arguments: Reg1toOtp(
    //                             email: emailController.text,
    //                             password: passController.text,
    //                             phoneCode: phCodeController.text,
    //                             phoneNumber: phoneController.text,
    //                           ));
    //                         }
    //                         );
    //                       }
    //                     },
    //                     child: Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: 20.w),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(next,style: PayNestTheme.subtitle16white,),
    //                           !loading ? ClipOval(child: Container(
    //                               padding: EdgeInsets.all(5),
    //                               decoration: BoxDecoration(
    //                                 color: PayNestTheme.colorWhite,
    //                                 borderRadius: BorderRadius.circular(50.r),
    //                               ),
    //                               child: Icon(Icons.arrow_forward,color: PayNestTheme.blueAccent,size: 12.sp,))):
    //                           SizedBox(
    //                             height: 10.sp,
    //                             width: 10.sp,
    //                             child: CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     // label:
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(vertical: 12.h),
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         height: 1.h,
    //                         width: 129.w,
    //                         decoration: BoxDecoration(
    //                           color: PayNestTheme.textGrey,
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: EdgeInsets.symmetric(horizontal: 16.w),
    //                         child: Text(or,style: PayNestTheme.h2_14textGrey,),
    //                       ),
    //                       Container(
    //                         height: 1.h,
    //                         width: 129.w,
    //                         decoration: BoxDecoration(
    //                           color: PayNestTheme.textGrey,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 60.h,
    //                   width: 326.w,
    //                   child: OutlinedButton.icon(
    //                     onPressed: (){},
    //                     icon: Image.asset(googleicon),
    //                     label: Text(google,style: PayNestTheme.title_3_16black,),
    //                     style: OutlinedButton.styleFrom(
    //                       // primary: MyTheme.sharpGreen,
    //                       elevation: 0,
    //                       // side: BorderSide(width:1, color:Colors.white),
    //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height: 16.h,),
    //
    //                 SizedBox(
    //                   height: 60.h,
    //                   width: 326.w,
    //                   child: OutlinedButton.icon(
    //                     onPressed: (){},
    //                     icon: Image.asset(facebookicon),
    //                     label: Text(facebook,style: PayNestTheme.title_3_16black,),
    //                     style: OutlinedButton.styleFrom(
    //                       // primary: MyTheme.sharpGreen,
    //                       elevation: 0,
    //                       // side: BorderSide(width:1, color:Colors.white),
    //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                Container(
                  height: 54.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    color: PayNestTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: PayNestTheme.colorWhite,
                    ),
                    // child: Text(""),
                  ),
                ),
                Spacer(),
                Image.asset(
                  welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                Spacer(),
              ],
            ),
            verticalSpacer(16),
            CustomSlider(currentIndex: 2),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? RegisterMainPage()
                      : index == 1
                          ? RegisterOtpPage()
                          : RegisterDetailPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
