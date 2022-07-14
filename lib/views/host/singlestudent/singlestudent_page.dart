import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/invoice_payment_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../../res/res.dart';

class SingleStudentPage extends StatefulWidget {
  SingleStudentModel singleStudentModel;

  SingleStudentPage({Key? key, required this.singleStudentModel})
      : super(key: key);

  @override
  State<SingleStudentPage> createState() => _SingleStudentPageState();
}

class _SingleStudentPageState extends State<SingleStudentPage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        decoration: BoxDecoration(
          color: PayNestTheme.primaryColor,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                verticalSpacer(32),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                    vertical: verticalValue(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 25.w),
                        child: Container(
                          height: 44.h,
                          width: 44.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                      Text(
                        'Student Details',
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.colorWhite,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                verticalSpacer(100),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: PayNestTheme.colorWhite,
                    ),
                    child: Column(
                      children: [
                        verticalSpacer(120),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Current Payable Amount',
                                style:
                                    PayNestTheme.h2_12blueAccentLight.copyWith(
                                  fontSize: sizes.fontRatio * 14,
                                  color: PayNestTheme.primaryColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${widget.singleStudentModel.student!.totalBalanceAmount}',
                                style: PayNestTheme.h2_12blueAccent.copyWith(
                                  fontSize: sizes.fontRatio * 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpacer(8),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          width: double.infinity,
                          height: 1,
                          color: PayNestTheme.textGrey.withOpacity(0.5),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Lottie.asset(
                            singleStudentJson,
                            repeat: true,
                            height: sizes.heightRatio * 250,
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: PayNestTheme.colorWhite,
                              elevation: 0,
                              side: BorderSide(
                                width: 1,
                                color: PayNestTheme.primaryColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: verticalValue(14),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InvoicePaymentPage(
                                    singleStudentModel:
                                        widget.singleStudentModel,
                                  ),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                continueToPayment,
                                style: PayNestTheme.title_2_16primaryColor
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: PayNestTheme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        verticalSpacer(24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: sizes.heightRatio * 100,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: PayNestTheme.colorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/1973964/screenshots/8807446/admissions_4x.jpg',
                      ),
                      minRadius: 20,
                      maxRadius: 32,
                    ),
                    verticalSpacer(8),
                    Text(
                      '${widget.singleStudentModel.student!.firstName + widget.singleStudentModel.student!.lastName}',
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(8),
                    Text(
                      'Grade ${widget.singleStudentModel.student!.grade}',
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.black,
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      'Grade ${widget.singleStudentModel.student!.school!.name}',
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.black,
                      ),
                    ),
                    verticalSpacer(8),
                    Text(
                      'Grade ${widget.singleStudentModel.student!.school!.address}',
                      style: PayNestTheme.small_2_10textGrey.copyWith(
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
