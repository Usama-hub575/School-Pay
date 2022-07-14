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
                            // return Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                            //   child: Column(
                            //     children: [
                            //       SizedBox(
                            //         height: 16.h,
                            //       ),
                            //       Container(
                            //         height: 28.w,
                            //         width: 1.sw,
                            //         decoration: BoxDecoration(
                            //             color: PayNestTheme.lineColor),
                            //         child: Padding(
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal: 20.w),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             children: [
                            //               Text(
                            //                 DateFormat("yyyy-MM-dd").format(
                            //                   transactionListController
                            //                       .transactionListData
                            //                       .value
                            //                       .transactions!
                            //                       .rows![index]
                            //                       .payedOn,
                            //                 ),
                            //                 style:
                            //                     PayNestTheme.small_2_12textGrey,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         height: 16.h,
                            //       ),
                            //       ListTile(
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(12),
                            //             side: BorderSide(
                            //                 width: 1.w,
                            //                 color: PayNestTheme.lineColor)),
                            //         onTap: () {
                            //           TransactionDetailModel tdm =
                            //               TransactionDetailModel(
                            //             id: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .id,
                            //             schoolId: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .schoolId,
                            //             parentId: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .parentId,
                            //             invoiceId: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .invoiceId,
                            //             studentId: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .studentId,
                            //             payedOn: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .payedOn,
                            //             amount: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .amount,
                            //             deletedAt: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .deletedAt,
                            //             refNo: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .refNo,
                            //             type: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .type,
                            //             vat: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .vat,
                            //             paynestFee: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .paynestFee,
                            //             country: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .country,
                            //             bankResponse: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .bankResponse,
                            //             amountToPay: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .amountToPay,
                            //             stringToBank: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .stringToBank,
                            //             stringFromBank:
                            //                 transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .stringFromBank,
                            //             createdAt: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .createdAt,
                            //             updatedAt: transactionListController
                            //                 .transactionListData
                            //                 .value
                            //                 .transactions!
                            //                 .rows![index]
                            //                 .updatedAt,
                            //             school: TransactionDetailSchool(
                            //                 id: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .id,
                            //                 name: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .name,
                            //                 deletedAt: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .deletedAt,
                            //                 addedBy: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .addedBy,
                            //                 address: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .address,
                            //                 description: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .description,
                            //                 vat: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .school!
                            //                     .vat,
                            //                 paynestFee:
                            //                     transactionListController.transactionListData.value.transactions!.rows![index].school!.paynestFee,
                            //                 apiKey: transactionListController.transactionListData.value.transactions!.rows![index].school!.apiKey,
                            //                 merchantId: transactionListController.transactionListData.value.transactions!.rows![index].school!.merchantId,
                            //                 file: transactionListController.transactionListData.value.transactions!.rows![index].school!.file,
                            //                 privacy: transactionListController.transactionListData.value.transactions!.rows![index].school!.privacy,
                            //                 createdAt: transactionListController.transactionListData.value.transactions!.rows![index].school!.createdAt,
                            //                 updatedAt: transactionListController.transactionListData.value.transactions!.rows![index].school!.updatedAt),
                            //             student: TransactionDetailStudent(
                            //                 dob: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .dob,
                            //                 admissionDate: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .admissionDate,
                            //                 id: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .id,
                            //                 studentRegNo: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .studentRegNo,
                            //                 firstName: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .firstName,
                            //                 lastName: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .lastName,
                            //                 grade: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .grade,
                            //                 parentEmiratesId: transactionListController
                            //                     .transactionListData
                            //                     .value
                            //                     .transactions!
                            //                     .rows![index]
                            //                     .student!
                            //                     .parentEmiratesId,
                            //                 parentPhoneNumber: transactionListController.transactionListData.value.transactions!.rows![index].student!.parentPhoneNumber,
                            //                 deletedAt: transactionListController.transactionListData.value.transactions!.rows![index].student!.deletedAt,
                            //                 schoolId: transactionListController.transactionListData.value.transactions!.rows![index].student!.schoolId,
                            //                 totalBalanceAmount: transactionListController.transactionListData.value.transactions!.rows![index].student!.totalBalanceAmount,
                            //                 guardianFirstName: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianFirstName,
                            //                 guardianLastName: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianLastName,
                            //                 guardianGender: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianGender,
                            //                 guardianEmiratesId: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianEmiratesId,
                            //                 guardianNationality: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianNationality,
                            //                 guardianReligion: transactionListController.transactionListData.value.transactions!.rows![index].student!.guardianReligion,
                            //                 area: transactionListController.transactionListData.value.transactions!.rows![index].student!.area,
                            //                 region: transactionListController.transactionListData.value.transactions!.rows![index].student!.region,
                            //                 streetAddress: transactionListController.transactionListData.value.transactions!.rows![index].student!.streetAddress,
                            //                 email: transactionListController.transactionListData.value.transactions!.rows![index].student!.email,
                            //                 phoneNumber: transactionListController.transactionListData.value.transactions!.rows![index].student!.phoneNumber,
                            //                 otherNumber: transactionListController.transactionListData.value.transactions!.rows![index].student!.otherNumber,
                            //                 profile: transactionListController.transactionListData.value.transactions!.rows![index].student!.profile,
                            //                 religion: transactionListController.transactionListData.value.transactions!.rows![index].student!.religion,
                            //                 nationality: transactionListController.transactionListData.value.transactions!.rows![index].student!.nationality,
                            //                 gender: transactionListController.transactionListData.value.transactions!.rows![index].student!.gender,
                            //                 dueDate: transactionListController.transactionListData.value.transactions!.rows![index].student!.dueDate,
                            //                 file: transactionListController.transactionListData.value.transactions!.rows![index].student!.file,
                            //                 privacy: transactionListController.transactionListData.value.transactions!.rows![index].student!.privacy,
                            //                 createdAt: transactionListController.transactionListData.value.transactions!.rows![index].student!.createdAt,
                            //                 updatedAt: transactionListController.transactionListData.value.transactions!.rows![index].student!.updatedAt),
                            //           );
                            //
                            //           Navigator.of(context).push(
                            //               MaterialPageRoute(
                            //                   builder: (context) =>
                            //                       TransactionDetailsPage(
                            //                         tdm: tdm,
                            //                       )));
                            //         },
                            //         title: Text(
                            //           transactionListController
                            //               .transactionListData
                            //               .value
                            //               .transactions!
                            //               .rows![index]
                            //               .school!
                            //               .name
                            //               .toString(),
                            //           style: PayNestTheme.title_3_16black,
                            //         ),
                            //         trailing: Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Text(
                            //               "AED " +
                            //                   transactionListController
                            //                       .transactionListData
                            //                       .value
                            //                       .transactions!
                            //                       .rows![index]
                            //                       .amount
                            //                       .toString(),
                            //               style: PayNestTheme
                            //                   .floating_12primaryColor,
                            //             ),
                            //             SizedBox(
                            //               width: 5.w,
                            //             ),
                            //             SvgPicture.asset(arrowNext),
                            //           ],
                            //         ),
                            //         subtitle: Text(
                            //           DateFormat("yyyy-MM-dd")
                            //               .format(transactionListController
                            //                   .transactionListData
                            //                   .value
                            //                   .transactions!
                            //                   .rows![index]
                            //                   .payedOn)
                            //               .toString(),
                            //           style: PayNestTheme.small_2_12textGrey,
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         height: 16.h,
                            //       ),
                            //     ],
                            //   ),
                            // );
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
                                        //
                                        '$key',
                                        style:
                                            PayNestTheme.h2_12blueAccent.copyWith(
                                          fontSize: sizes.fontRatio * 14,
                                          color: PayNestTheme.black,
                                          fontWeight: FontWeight.w700,
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
