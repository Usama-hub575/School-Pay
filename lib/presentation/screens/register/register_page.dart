import 'package:get/get.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool buttonEnable = false;
  int _currentIndex = 0;
  String email = '';
  String password = '';
  String phoneNumber = '';
  String phoneCode = '';
  UserController userController = Get.put(UserController());
  MySharedPreferences preferences = MySharedPreferences.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(25),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: buttonEnable
                      ? null
                      : () {
                          if (_currentIndex == 1 || _currentIndex == 2) {
                            _currentIndex = 0;
                            setState(() {});
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                  child: Container(
                    height: sizes.heightRatio * 46,
                    width: sizes.widthRatio * 46,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1.0,
                          offset: Offset(
                            1.3, // Move to right 10  horizontally
                            1.3, // Move to bottom 10 Vertically
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      color: PayNestTheme.primaryColor,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: PayNestTheme.colorWhite,
                    ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AppAssets().welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                const Spacer(),
              ],
            ),
            verticalSpacer(16),
            CustomSlider(
              currentIndex: _currentIndex,
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _currentIndex == 0
                      ? RegisterMainPage(
                          onButtonTap: (value) => setState(
                            () => buttonEnable = value,
                          ),
                          onNextTap: (email, password, phoneCode, phoneNumber) {
                            _currentIndex = 1;
                            this.email = email;
                            this.password = password;
                            this.phoneCode = phoneCode;
                            this.phoneNumber = phoneNumber;
                            setState(() {});
                          },
                        )
                      : _currentIndex == 1
                          ? RegisterOTPPage(
                              email: email,
                              password: password,
                              phoneCode: phoneCode,
                              phoneNumber: phoneNumber,
                              onSuccess: () {
                                _currentIndex = 2;
                                setState(() {});
                              },
                            )
                          : RegisterDetailPage(
                              email: email,
                              password: password,
                              phoneCode: phoneCode,
                              phoneNumber: phoneCode,
                              onTap: (
                                fName,
                                lName,
                                gender,
                                emiratesID,
                                expiryDate,
                                address,
                                city,
                                countryCode,
                                country,
                              ) async {
                                await userController.hitRegister(
                                  fName,
                                  lName,
                                  password,
                                  email,
                                  countryCode,
                                  phoneCode,
                                  phoneNumber,
                                  emiratesID,
                                  gender,
                                  '',
                                  emiratesID,
                                );
                                if (userController.userResData.value.status ==
                                    true) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/DashboardPage',
                                      (Route<dynamic> route) => false);
                                } else {
                                  showToast(
                                    message: userController.isFailed.toString(),
                                    context: context,
                                    color: PayNestTheme.red,
                                  );
                                }
                              },
                            );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
