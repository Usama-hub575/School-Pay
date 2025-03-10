import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/transactionlist_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/transaction/widgets/single_transaction_card.dart';
import 'package:paynest_flutter_app/views/host/transactiondetails/transactiondetails_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/response/dashboard/transaction/transaction_detail/transaction_detail_model.dart';
import '../../../data/model/response/dashboard/transaction/transaction_list_response/transaction_list_response_model.dart';
import '../../../presentation/res/res.dart';
import 'widgets/shimmer_card.dart';

class RecentTransactionPage extends StatefulWidget {
  final String whichStack;

  const RecentTransactionPage({required this.whichStack, Key? key})
      : super(key: key);

  @override
  State<RecentTransactionPage> createState() => _RecentTransactionPageState();
}

class _RecentTransactionPageState extends State<RecentTransactionPage> {
  TransactionListController transactionListController =
      Get.put(TransactionListController());
  final UserController userController = Get.find<UserController>();
  var sorted = [];
  late DateFormat dateFormat;
  late int loaderValue;
  bool shimmerValue = true;

  @override
  void initState() {
    super.initState();
    getValue();
    fetchTransactions();

    Future.delayed(Duration.zero, () {
      initializeDateFormatting();
      dateFormat = DateFormat.yMMMMd('en_GB');
    });
  }

  fetchTransactions() async {
    shimmerValue = true;
    if (mounted) {
      setState(() {});
    }
    await transactionListController.hitTransaction(
      userController.userResData.value.parent!.id.toString(),
    );

    shimmerValue = false;
    if (mounted) {
      setState(() {});
    }
  }

  getValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    loaderValue = (preferences.getInt('showLoader')) ?? 0;
    if (loaderValue != 1) {
      shimmerValue = true;
      if (mounted) {
        setState(() {});
      }
    }
  }

  void storeLoaderVal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('showLoader', 1);
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
                          : const SizedBox(),
                      Expanded(
                        child: Text(
                          transactions,
                          textAlign: TextAlign.center,
                          style: PayNestTheme.title20white.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'montserratBold',
                              fontSize: sizes.fontRatio * 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          shimmerValue
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: horizontalValue(32),
                            ),
                            child: Row(
                              children: [
                                FadeShimmer(
                                  width: sizes.widthRatio * 120,
                                  height: sizes.heightRatio * 20,
                                  baseColor: const Color(0xFFEBEBF4),
                                  highlightColor: const Color(0xFFF4F4F4),
                                  radius: 10,
                                ),
                                horizontalSpacer(8),
                                const Expanded(
                                  child: FadeShimmer(
                                    height: 1,
                                    width: double.infinity,
                                    baseColor: Color(0xFFEBEBF4),
                                    highlightColor: Color(0xFFF4F4F4),
                                    // radius: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(12),
                          const TransactionShimmerCard(),
                          verticalSpacer(12),
                        ],
                      );
                    },
                  ),
                )
              : Obx(
                  () => !transactionListController.isLoading.value
                      ? transactionListController.transactionListData.value
                              .transactions!.rows!.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    transactionListController.list.length,
                                itemBuilder: (context, index) {
                                  String key = transactionListController
                                      .list.keys
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
                                              dateFormat
                                                  .format(DateTime.parse(key)),
                                              style: PayNestTheme
                                                  .h2_12blueAccent
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
                                            transactionListController.list[key],
                                        onTap: (transactionRow) {
                                          onTap(row: transactionRow);
                                        },
                                      ),
                                      verticalSpacer(12),
                                    ],
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: Column(
                                  children: [
                                    verticalSpacer(100),
                                    Container(
                                      width: sizes.widthRatio * 150,
                                      height: sizes.heightRatio * 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            AppAssets().noData,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    verticalSpacer(20),
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        noDataText,
                                        style: PayNestTheme.title_3_16blackbold
                                            .copyWith(
                                          fontSize: sizes.fontRatio * 22,
                                          color: PayNestTheme.primaryColor,
                                          fontFamily: 'montserratBold',
                                        ),
                                      ),
                                    ),
                                    verticalSpacer(10),
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        sorryWeCant,
                                        textAlign: TextAlign.center,
                                        style: PayNestTheme.title_3_16blackbold
                                            .copyWith(
                                          fontSize: sizes.fontRatio * 16,
                                          color: PayNestTheme.lightBlack,
                                          fontFamily: 'montserratBold',
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    verticalSpacer(16),
                                  ],
                                ),
                              ),
                            )
                      : const SizedBox(),
                ),
        ],
      ),
    );
  }

  void onTap({required TransactionsRow row}) {
    TransactionDetailModel tdm = TransactionDetailModel(
      id: row.id,
      schoolId: row.schoolId,
      parentId: row.parentId,
      invoiceId: row.invoiceId,
      studentId: row.studentId,
      payedOn: row.payedOn,
      amount: row.amount,
      deletedAt: row.deletedAt,
      refNo: row.refNo,
      type: row.type,
      vat: row.vat,
      paynestFee: row.paynestFee,
      country: row.country,
      bankResponse: row.bankResponse,
      amountToPay: row.amountToPay,
      stringToBank: row.stringToBank,
      stringFromBank: row.stringFromBank,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      school: TransactionDetailSchool(
          id: row.school!.id,
          name: row.school!.name,
          deletedAt: row.school!.deletedAt,
          addedBy: row.school!.addedBy,
          address: row.school!.address,
          description: row.school!.description,
          vat: row.school!.vat,
          paynestFee: row.school!.paynestFee,
          apiKey: row.school!.apiKey,
          merchantId: row.school!.merchantId,
          file: row.school!.file,
          privacy: row.school!.privacy,
          createdAt: row.school!.createdAt,
          updatedAt: row.school!.updatedAt),
      student: TransactionDetailStudent(
          dob: row.student!.dob,
          admissionDate: row.student!.admissionDate,
          id: row.student!.id,
          studentRegNo: row.student!.studentRegNo,
          firstName: row.student!.firstName,
          lastName: row.student!.lastName,
          grade: row.student!.grade,
          parentEmiratesId: row.student!.parentEmiratesId,
          parentPhoneNumber: row.student!.parentPhoneNumber,
          deletedAt: row.student!.deletedAt,
          schoolId: row.student!.schoolId,
          totalBalanceAmount: row.student!.totalBalanceAmount,
          guardianFirstName: row.student!.guardianFirstName,
          guardianLastName: row.student!.guardianLastName,
          guardianGender: row.student!.guardianGender,
          guardianEmiratesId: row.student!.guardianEmiratesId,
          guardianNationality: row.student!.guardianNationality,
          guardianReligion: row.student!.guardianReligion,
          area: row.student!.area,
          region: row.student!.region,
          streetAddress: row.student!.streetAddress,
          email: row.student!.email,
          phoneNumber: row.student!.phoneNumber,
          otherNumber: row.student!.otherNumber,
          profile: row.student!.profile,
          religion: row.student!.religion,
          nationality: row.student!.nationality,
          gender: row.student!.gender,
          dueDate: row.student!.dueDate,
          file: row.student!.file,
          privacy: row.student!.privacy,
          createdAt: row.student!.createdAt,
          updatedAt: row.student!.updatedAt),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionDetailsPage(
          tdm: tdm,
        ),
      ),
    );
  }
}
