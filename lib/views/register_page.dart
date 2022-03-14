import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;
  var flag,countryCode;
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
                Text(register,style: PayNestTheme.title20primaryColor,),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h,bottom: 12.h),
              child: Text(pleaseenterdetailbelow,style: PayNestTheme.title22black,),
            ),
            Text(weuseyourphone,style: PayNestTheme.h2_14textGrey,),
            SizedBox(height: 46.h,),
            // Scrollable
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        width: 1.w,
                        color: PayNestTheme.dropShadow
                      )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            favorite: ['+39','FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                        Expanded(
                          flex:2,
                          child:TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: phone,
                              // labelStyle: CustomizedTheme.b_W400_12,
                              // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Container(
                  //   height: 70.h,
                  //   width: 1.sw,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12.r),
                  //     color: PayNestTheme.colorWhite,
                  //     border: Border.all(color: PayNestTheme.dropShadow,width: 1.w)
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       CountryCodePicker(
                  //         onChanged: print,
                  //         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  //         initialSelection: 'IT',
                  //         favorite: ['+39','FR'],
                  //         // optional. Shows only country name and flag
                  //         showCountryOnly: false,
                  //         // optional. Shows only country name and flag when popup is closed.
                  //         showOnlyCountryWhenClosed: false,
                  //         // optional. aligns the flag and the Text left
                  //         alignLeft: false,
                  //       ),
                  //       SizedBox(width: 6,),
                  //       Icon(Icons.arrow_drop_down),
                  //       TextFormField(
                  //         decoration: InputDecoration(
                  //           // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  //               borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                  //           labelText: phone,
                  //           // labelStyle: CustomizedTheme.b_W400_12,
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  //             borderSide: BorderSide(color: Colors.black),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 13.h,),

                  TextFormField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                      labelText: email,
                      // labelStyle: CustomizedTheme.b_W400_12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                      labelText: password,
                      // labelStyle: CustomizedTheme.b_W400_12,
                      suffixText: show,
                      // suffixStyle: ,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    value: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Row(
                      children: [
                        Text('I accept',style: PayNestTheme.small_14black,),
                        GestureDetector(
                            onTap: (){

                            },
                            child: Text(' Terms & Conditions.',style: PayNestTheme.small_14blueAccent,)
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.all(0),
                    onChanged: (newValue) {
                      setState(() {
                        // _throwShotAway = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 52.h,),
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
                      onPressed: (){
                        setState(() {
                          loading = true;
                        });
                        Future.delayed(
                            Duration(seconds: 3),(){
                              setState(() {
                                loading = false;
                              });
                            Navigator.pushNamed(context, '/OTPPage');
                          }
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(next,style: PayNestTheme.subtitle16white,),
                          !loading ? Icon(Icons.play_circle_fill,color: Colors.white,):
                          SizedBox(
                            height: 10.sp,
                            width: 10.sp,
                            child: CircularProgressIndicator(backgroundColor: Colors.white,),
                          ),
                        ],
                      ),
                      // label:
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Container(
                          height: 1.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.textGrey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(or,style: PayNestTheme.h2_14textGrey,),
                        ),
                        Container(
                          height: 1.h,
                          width: 129.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    width: 326.w,
                    child: OutlinedButton.icon(
                      onPressed: (){},
                      icon: Image.asset(googleicon),
                      label: Text(google,style: PayNestTheme.title_3_16black,),
                      style: OutlinedButton.styleFrom(
                        // primary: MyTheme.sharpGreen,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h,),

                  SizedBox(
                    height: 60.h,
                    width: 326.w,
                    child: OutlinedButton.icon(
                      onPressed: (){},
                      icon: Image.asset(facebookicon),
                      label: Text(facebook,style: PayNestTheme.title_3_16black,),
                      style: OutlinedButton.styleFrom(
                        // primary: MyTheme.sharpGreen,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
