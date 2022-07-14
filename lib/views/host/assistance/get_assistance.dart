import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class GetAssistance extends StatefulWidget {
  const GetAssistance({Key? key}) : super(key: key);

  @override
  State<GetAssistance> createState() => _GetAssistanceState();
}

class _GetAssistanceState extends State<GetAssistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: PayNestTheme.primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.r),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 25.h, top: 15.h),
                      child: Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                            color: PayNestTheme.colorWhite,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,
                              size: 20.sp, color: PayNestTheme.blueAccent),
                          // child: Text(""),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 34.h,
                        bottom: 11.h,
                        left: 7.w,
                        right: 7.w,
                      ),
                      child: Text(
                        assistance,
                        style: PayNestTheme.title20white,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          verticalSpacer(24),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
              vertical: verticalValue(16),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PayNestTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appTutorials,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: sizes.widthRatio * 280,
                      child: Text(
                        appManual,
                        style: PayNestTheme.small_2_12black.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(24),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
              vertical: verticalValue(16),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PayNestTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactCustomerCare,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: sizes.widthRatio * 280,
                      child: Text(
                        shareYourQuery,
                        style: PayNestTheme.small_2_12black.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(24),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
              vertical: verticalValue(16),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PayNestTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      faqs,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: sizes.widthRatio * 280,
                      child: Text(
                        goThrough,
                        style: PayNestTheme.small_2_12black.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(24),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalValue(20),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
              vertical: verticalValue(16),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PayNestTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      liveChat,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: sizes.widthRatio * 280,
                      child: Text(
                        chatWith,
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
