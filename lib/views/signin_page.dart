import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // LoginController userController = Get.put(LoginController());
  UserController userController = Get.put(UserController());
  final accessToken = GetStorage();

  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BlueBackButton(context: context,),
                  SizedBox(width: 20.w,),
                  Text(signIn,style: PayNestTheme.title20primaryColor,),
                ],
              ),
              Form(
                key: Utils.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 58.h,),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                            borderSide: BorderSide(color: PayNestTheme.blueAccent,width: 1.0.w)),
                        labelText: email,
                        // labelStyle: CustomizedTheme.b_W400_12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: PayNestTheme.blueAccent),
                        ),
                      ),
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter email';
                        }
                        // Check if the entered email has the right format
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Invalid email';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                    ),
                    SizedBox(height: 13.h,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                            borderSide: BorderSide(color: PayNestTheme.blueAccent,width: 1.0.w)),
                        labelText: password,
                        // labelStyle: CustomizedTheme.b_W400_12,
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
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: PayNestTheme.blueAccent),
                        ),
                      ),
                      autovalidateMode:AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        // Check if the entered email has the right format
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 16.h,bottom: 72.h),
                child: Text(forgotpassword,style: PayNestTheme.h2_14blueAccent,),
              ),
              InkWell(
                child: Center(
                    child: Image.asset(touchid)
                )),
              SizedBox(height: 47.h,),

              Obx(() => SizedBox(
                height: 60.h,
                width: 326.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: PayNestTheme.blueAccent,
                      elevation: 0,
                      // side: BorderSide(width:1, color:Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      if(Utils.loginFormKey.currentState!.validate()){
                        await userController.hitLogin(emailController.text.trim(),passwordController.text.trim(),accessToken.read('fcmToken'));
                        if(userController.userResData.value.status == true){
                          accessToken.write('accessToken', userController.userResData.value.token);
                          Navigator.pushNamedAndRemoveUntil(context, '/DashboardPage',(Route<dynamic> route) => false);
                        }else if(userController.userResData.value.status == false){
                          passwordController.clear();
                          if(userController.retriesTime.value != ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please retry after "+ userController.retriesTime.value.toString()+" min"),backgroundColor: Colors.red,));
                          }else if(userController.attemptsRemain.value != ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userController.attemptsRemain.value.toString() +" attempts remaining"),backgroundColor: Colors.red,));

                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Entered email or password does not match"),backgroundColor: Colors.red,));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Entered email or password does not match"),backgroundColor: Colors.red,));
                        }
                      }
                    },
                    child: !userController.isLoading.value ? Text(signIn,style: PayNestTheme.subtitle16white): Center(child: CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,color: PayNestTheme.blueAccent,))
                ),
              )),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    Container(
                      height: 1.h,
                      width: 129.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE4E6EC),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(or),
                    ),
                    Container(
                      height: 1.h,
                      width: 129.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE4E6EC),
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
                  label: Text(google),
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
                  label: Text(facebook),
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
      ),
    );
  }
}
