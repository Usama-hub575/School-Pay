import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../presentation/res/res.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizes.heightRatio * 150,
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
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 20.sp,
                                color: PayNestTheme.primaryColor,
                              ),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        horizontalSpacer(8),
                        Row(
                          children: [
                            SizedBox(
                              height: 44.h,
                              width: 44.w,
                              child: Lottie.asset(
                                AppAssets().notificationAnimation,
                                repeat: false,
                                animate: false,
                              ),
                            ),
                            horizontalSpacer(5),
                            Text(
                              notifications,
                              style: PayNestTheme.title20white.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'montserratBold',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Text(
              "See what you missed",
              style: PayNestTheme.small_2_12black
                  .copyWith(fontFamily: "montserratMedium"),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              children: [
                paymentReminder(title: 'PAYMENT REMINDER', date: '9 Jan 2022'),
                verticalSpacer(12),
                transactionSuccessFull(
                    title: 'Transaction Successful',
                    date: '9 Jan 2022',
                    subtitle: "Has Been Paid As Home Owners Service Charges",
                    amount: "AED\n20.00"),
                verticalSpacer(12),
                transactionSuccessFailed(
                    title: 'Transaction Failed',
                    date: '9 Jan 2022',
                    subtitle:
                        "We Could Not Proceed Your Transaction Due To Insufficient Balance.",
                    amount: "AED\n20.00"),
                verticalSpacer(12),
                configurePaymentWithoutButton(
                    title: 'Configure Payment Methods',
                    date: '9 Jan 2022',
                    subtitle:
                        "You Need To Configure Payment Method Before Making Any Transaction."),
                verticalSpacer(12),
                configurePaymentWithButton(
                    title: 'Configure Payment Methods',
                    date: '9 Jan 2022',
                    onPress: () {},
                    subtitle:
                        "You Need To Configure Payment Method Before Making Any Transaction."),
                verticalSpacer(18),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget paymentReminder({required title, required date}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(20),
        ),
        child: Row(
          children: [
            Text(
              "Payment Reminder",
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.black,
                fontFamily: 'montserratBold',
              ),
            ),
            horizontalSpacer(8),
            Expanded(
              child: Container(
                height: 1,
                color: PayNestTheme.textGrey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      verticalSpacer(12),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: PayNestTheme.colorWhite,
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Lottie.asset(
              AppAssets().notificationAnimation,
              repeat: true,
              width: sizes.widthRatio * 37,
              height: sizes.heightRatio * 37,
            ),
            horizontalSpacer(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PayNestTheme.h2_12blueAccent.copyWith(
                    fontSize: sizes.fontRatio * 13,
                    color: PayNestTheme.black,
                  ),
                ),
                verticalSpacer(8),
                Text(
                  date,
                  style: PayNestTheme.h2_12blueAccent.copyWith(
                    fontSize: sizes.fontRatio * 14,
                    color: PayNestTheme.textGrey.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Lottie.asset(
              AppAssets().arrowForwardAnimation,
              repeat: true,
              width: sizes.widthRatio * 18,
              height: sizes.heightRatio * 18,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget transactionSuccessFull(
    {required title, required date, required subtitle, required amount}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(20),
        ),
        child: Row(
          children: [
            Text(
              date,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.black,
                fontFamily: 'montserratBold',
              ),
            ),
            horizontalSpacer(8),
            Expanded(
              child: Container(
                height: 1,
                color: PayNestTheme.textGrey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      verticalSpacer(12),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: PayNestTheme.colorWhite,
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Lottie.asset(
              AppAssets().successCheckAnimation,
              repeat: true,
              width: sizes.widthRatio * 45,
              height: sizes.heightRatio * 45,
            ),
            horizontalSpacer(12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: PayNestTheme.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: PayNestTheme.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              amount,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget transactionSuccessFailed(
    {required title, required date, required subtitle, required amount}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(20),
        ),
        child: Row(
          children: [
            Text(
              date,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.black,
                fontFamily: 'montserratBold',
              ),
            ),
            horizontalSpacer(8),
            Expanded(
              child: Container(
                height: 1,
                color: PayNestTheme.textGrey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      verticalSpacer(12),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: PayNestTheme.colorWhite,
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Lottie.asset(
              AppAssets().successCheckAnimation,
              repeat: true,
              width: sizes.widthRatio * 45,
              height: sizes.heightRatio * 45,
            ),
            horizontalSpacer(12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: PayNestTheme.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: PayNestTheme.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              amount,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 13,
                color: PayNestTheme.red,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget configurePaymentWithoutButton(
    {required title, required date, required subtitle}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(20),
        ),
        child: Row(
          children: [
            Text(
              date,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.black,
                fontFamily: 'montserratBold',
              ),
            ),
            horizontalSpacer(8),
            Expanded(
              child: Container(
                height: 1,
                color: PayNestTheme.textGrey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      verticalSpacer(12),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: PayNestTheme.colorWhite,
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Lottie.asset(
              AppAssets().supportAnimation,
              repeat: true,
              width: sizes.widthRatio * 37,
              height: sizes.heightRatio * 37,
            ),
            horizontalSpacer(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: PayNestTheme.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    subtitle,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: PayNestTheme.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget configurePaymentWithButton(
    {required title, required date, required subtitle, required onPress}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(20),
        ),
        child: Row(
          children: [
            Text(
              date,
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.black,
                fontFamily: 'montserratBold',
              ),
            ),
            horizontalSpacer(8),
            Expanded(
              child: Container(
                height: 1,
                color: PayNestTheme.textGrey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
      verticalSpacer(12),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: PayNestTheme.colorWhite,
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Lottie.asset(
              AppAssets().supportAnimation,
              repeat: true,
              width: sizes.widthRatio * 37,
              height: sizes.heightRatio * 37,
            ),
            horizontalSpacer(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: PayNestTheme.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    subtitle,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: PayNestTheme.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  verticalSpacer(4),
                  Container(
                    width: sizes.widthRatio * 100,
                    height: sizes.heightRatio * 18,
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(4),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PayNestTheme.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onPress,
                      child: Text(
                        "Configure Now",
                        maxLines: 1,
                        style: PayNestTheme.subtitle16white.copyWith(
                            fontSize: sizes.fontRatio * 8,
                            fontFamily: "montserratBold"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
