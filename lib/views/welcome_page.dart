import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final fcmToken = GetStorage();
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    getFCMToken();
  }

  getFCMToken() async {
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      fcmToken.write('fcmToken', value);
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    print(fcmToken.read('fcmToken'));
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1.sw,
              height: 1.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splash),
                  fit: BoxFit.fill
                ),
              ),
            ),
            Positioned(
              top: ScreenUtil().screenHeight * 0.35,
              // left: ScreenUtil().screenWidth * 0.3,
              // right: ScreenUtil().screenWidth * 0.35,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(paynestLogo,semanticsLabel: paynest),
                    SizedBox(height: 30.63.h,),
                    Text(slogan,style: PayNestTheme.title24white),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().screenHeight * 0.05,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 326.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.blueAccent,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/SignInPage');
                          },
                          child: Text(signIn,style: PayNestTheme.subtitle16white,)
                        ),
                      ),
                      SizedBox(height: 16.h,),
                      SizedBox(
                        height: 60.h,
                        width: 326.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.colorWhite,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/RegisterPage');
                          },
                          child: Text(register,style: PayNestTheme.title_2_16primaryColor,)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
