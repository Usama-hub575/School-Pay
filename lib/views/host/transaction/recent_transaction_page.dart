import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/transactionlist_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/transactiondetail_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/transaction/widgets/single_transaction_card.dart';
import 'package:paynest_flutter_app/views/host/transactiondetails/transactiondetails_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../main.dart';

class RecentTransactionPage extends StatefulWidget {
  final String whichStack;

  RecentTransactionPage({required this.whichStack, Key? key}) : super(key: key);

  @override
  State<RecentTransactionPage> createState() => _RecentTransactionPageState();
}

class _RecentTransactionPageState extends State<RecentTransactionPage> {
  TransactionListController transactionListController =
      Get.put(TransactionListController());
  final UserController userController = Get.find<UserController>();
  var sorted = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  fetchTransactions() async {
    await transactionListController.hitTransaction(
      userController.userResData.value.parent!.id.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: sizes.heightRatio * 140,
            decoration: BoxDecoration(
              color: PayNestTheme.primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpacer(24),
                  Row(
                    children: [
                      widget.whichStack == "other"
                          ? Padding(
                              padding: EdgeInsets.only(right: 25.h),
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
                                  icon: Icon(Icons.clear,
                                      size: 20.sp,
                                      color: PayNestTheme.blueAccent),
                                  // child: Text(""),
                                ),
                              ),
                            )
                          : SizedBox(),
                      Expanded(
                        child: Text(
                          transactions,
                          textAlign: TextAlign.center,
                          style: PayNestTheme.title20white.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'montserratBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => !transactionListController.isLoading.value
                ? transactionListController.list.value.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount:
                              transactionListController.list.value.length,
                          itemBuilder: (context, index) {
                            String key = transactionListController
                                .list.value.keys
                                .elementAt(index);
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${dateFormat.format(DateTime.parse(key))}',
                                        style: PayNestTheme.h2_12blueAccent
                                            .copyWith(
                                          fontSize: sizes.fontRatio * 16,
                                          color: PayNestTheme.black,
                                          fontFamily: 'montserratBold',
                                        ),
                                      ),
                                      horizontalSpacer(8),
                                      Expanded(
                                        child: Container(
                                          height: 1,
                                          color: PayNestTheme.textGrey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacer(12),
                                SingleTransaction(
                                  transactionList:
                                      transactionListController.list.value[key],
                                ),
                                verticalSpacer(12),
                              ],
                            );
                          },
                        ),
                      )
                    : SizedBox.shrink()
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
