import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/more/widget/single_card.dart';
import 'package:paynest_flutter_app/views/host/more/widget/single_card_with_radio_button.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';
import 'package:paynest_flutter_app/views/host/viewprofile/view_profile.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/auth/local_auth_api.dart';
import '../../../presentation/res/res.dart';
import '../../../utils/sharedPrefKeys.dart';
import '../../../utils/sharedpref.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final UserController userController = Get.find<UserController>();
  MySharedPreferences storage = MySharedPreferences.instance;
  late bool isBioMetricButtonEnable;

  @override
  void initState() {
    isBioMetricButtonEnable = false;
    isBioMetricButtonEnable = storage.getBoolValue(SharedPrefKeys.isBioMatric);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 240.h,
            child: Stack(
              children: [
                Container(
                  height: 172.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: PayNestTheme.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: PayNestTheme.dropShadow.withOpacity(.3),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(
                          0,
                          5,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      setting,
                      style: PayNestTheme.title20white.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 18),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 130,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(30),
                      vertical: verticalValue(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(12),
                      vertical: verticalValue(18),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: PayNestTheme.dropShadow.withOpacity(.3),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(
                            0,
                            5,
                          ), // changes position of shadow
                        ),
                      ],
                      color: PayNestTheme.colorWhite,
                      borderRadius: BorderRadius.circular(
                        26,
                      ),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => userController.userResData.value.parent!
                                          .profileImage ==
                                      null &&
                                  userController.userResData.value.parent!
                                          .profileImage !=
                                      ""
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    userController.userResData.value.parent!
                                        .profileImage!,
                                  ),
                                )
                              : Container(
                                  height: sizes.heightRatio * 60,
                                  width: sizes.widthRatio * 60,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5,
                                          offset: Offset(
                                            0.5, // Move to right 10  horizontally
                                            0.5, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ]),
                                  child: SvgPicture.asset(
                                    AppAssets().icMale,
                                  ),
                                ),
                        ),
                        horizontalSpacer(16),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${userController.userResData.value.parent!.firstName} ${userController.userResData.value.parent!.lastName}',
                                style: PayNestTheme.title18black.copyWith(
                                  fontSize: sizes.fontRatio * 18,
                                  fontFamily: 'montserratBold',
                                ),
                              ),
                              verticalSpacer(4),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ViewProfile(),
                                    ),
                                  );
                                },
                                child: Text(
                                  viewprofile,
                                  style: PayNestTheme.title18black.copyWith(
                                    fontSize: sizes.fontRatio * 12,
                                    color: PayNestTheme.primaryColor,
                                    fontFamily: 'montserratSemiBold',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        payments,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          color: PayNestTheme.black,
                          fontSize: sizes.fontRatio * 16,
                          fontFamily: 'montserratBold',
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: AppAssets().icPaymentHistory,
                      value: paymentHistory,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RecentTransactionPage(
                              whichStack: "other",
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpacer(16),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        general,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          color: PayNestTheme.black,
                          fontSize: sizes.fontRatio * 16,
                          fontFamily: 'montserratBold',
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                    SingleCardWithRadioButton(
                      value: biometricAuth,
                      icon: AppAssets().icFingerPrint,
                      isEnable: storage.getBoolValue(
                        SharedPrefKeys.isBioMatric,
                      ),
                      onTap: (value) async {
                        if (value) {
                          isBioMetricButtonEnable =
                              await LocalAuthApi.authenticateWithBiometrics();
                        }
                        if (!value) {
                          storage.setBoolValue(
                            SharedPrefKeys.isBioMatric,
                            isBioMetricButtonEnable = false,
                          );
                        } else {
                          storage.setBoolValue(
                            SharedPrefKeys.isBioMatric,
                            isBioMetricButtonEnable,
                          );
                        }
                        setState(() {});
                      },
                    ),
                    verticalSpacer(16),
                    // SingleCardWithRadioButton(
                    //   value: Location,
                    //   isEnable: false,
                    //   icon: icLocation,
                    //   onTap: () {},
                    // ),
                    verticalSpacer(16),
                    // LanguageCard(),
                    verticalSpacer(16),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        privacy,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          color: PayNestTheme.black,
                          fontSize: sizes.fontRatio * 16,
                          fontFamily: 'montserratBold',
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: AppAssets().icFaq,
                      value: fAQs,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            'https://paynest.ae/#faq',
                          ),
                        );
                        setState(() {});
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: AppAssets().icContactUs,
                      value: contactUs,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            'https://paynest.ae/#faq',
                          ),
                        );
                        setState(() {});
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: AppAssets().icPrivacyPolicy,
                      value: privacyPolicy,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            'https://paynest.ae/privacy-policy.html',
                          ),
                        );

                        setState(() {});
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: AppAssets().icTermsAndCondition,
                      value: termConditions,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            'https://paynest.ae/terms.html',
                          ),
                        );
                        setState(() {});
                      },
                    ),
                    verticalSpacer(16),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: horizontalValue(16),
                    //   ),
                    //   width: 1.sw,
                    //   height: 1.h,
                    //   color: PayNestTheme.lineColor,
                    // ),
                    verticalSpacer(5),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: PayNestTheme.colorRedShade,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12.r,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: verticalValue(16),
                            )),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const WelcomePage(),
                            ),
                            (Route route) => false,
                          );
                        },
                        child: Text(
                          signOut,
                          style: PayNestTheme.title_3_16white.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.colorWhite,
                            fontFamily: 'montserratBold',
                          ),
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
