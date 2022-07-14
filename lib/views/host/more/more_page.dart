import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/more/widget/language_card.dart';
import 'package:paynest_flutter_app/views/host/more/widget/single_card.dart';
import 'package:paynest_flutter_app/views/host/more/widget/single_card_with_radio_button.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';
import 'package:paynest_flutter_app/views/host/viewprofile/view_profile.dart';
import 'package:paynest_flutter_app/views/welcome_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240.h,
            child: Stack(
              children: [
                Container(
                  height: 172.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: PayNestTheme.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      setting,
                      style: PayNestTheme.title20white
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 130,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                      vertical: verticalValue(16),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: PayNestTheme.dropShadow.withOpacity(.3),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(
                            0,
                            5,
                          ), // changes position of shadow
                        ),
                      ],
                      color: PayNestTheme.colorWhite,
                      borderRadius: BorderRadius.circular(
                        24.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => CircleAvatar(
                            backgroundImage: userController.userResData.value
                                        .parent!.profileImage ==
                                    null
                                ? NetworkImage(
                                    'https://cdn2.vectorstock.com/i/1000x1000/20/76/man-avatar-profile-vector-21372076.jpg',
                                  )
                                : NetworkImage(
                                    'https://cdn2.vectorstock.com/i/1000x1000/20/76/man-avatar-profile-vector-21372076.jpg',
                                  ),
                          ),
                        ),
                        horizontalSpacer(16),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpacer(8),
                              Text(
                                userController
                                    .userResData.value.parent!.firstName
                                    .toString(),
                                style: PayNestTheme.title18black,
                              ),
                              verticalSpacer(4),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ViewProfile(),
                                    ),
                                  );
                                },
                                child: Text(
                                  viewprofile,
                                  style: PayNestTheme.h2_12blueAccent,
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
              physics: BouncingScrollPhysics(),
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
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: ic_paymentHistory,
                      value: paymentHistory,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RecentTransactionPage(
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
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                    SingleCardWithRadioButton(
                      value: biometricAuth,
                      icon: ic_biometric,
                      onTap: () {},
                    ),
                    verticalSpacer(16),
                    SingleCardWithRadioButton(
                      value: Location,
                      icon: ic_location,
                      onTap: () {},
                    ),
                    verticalSpacer(16),
                    LanguageCard(),
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
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: faq,
                      value: FAQ,
                      onTap: () {},
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: ic_contactUs,
                      value: contactUs,
                      onTap: () {},
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: ic_privacyPolicy,
                      value: privacyPolicy,
                      onTap: () {},
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: ic_terms,
                      value: termConditions,
                      onTap: () {},
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
                    SizedBox(
                      width: 1.sw,
                      height: 60.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            // the new route
                            MaterialPageRoute(
                              builder: (BuildContext context) => WelcomePage(),
                            ),
                            (Route route) => false,
                          );
                        },
                        child: Text(
                          signOut,
                          style: PayNestTheme.title_3_16white.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.colorWhite,
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
