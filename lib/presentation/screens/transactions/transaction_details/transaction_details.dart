import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class TransactionDetailsPage extends StatefulWidget {
  final TransactionDetailModel transactionDetailModel;

  const TransactionDetailsPage({
    Key? key,
    required this.transactionDetailModel,
  }) : super(key: key);

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

RegisterResponseModel registerResponseModel = RegisterResponseModel.empty();

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: verticalValue(300),
            child: Stack(
              children: [
                Container(
                  height: verticalValue(210),
                  // width: horizontalValue(100),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: horizontalValue(25),
                        top: verticalValue(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppBarBackButton(
                                    iconColor: colors.primaryColor,
                                    buttonColor: colors.white,
                                  ),
                                  horizontalSpacer(25),
                                  Text(
                                    recentTransaction,
                                    style: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 18,
                                      color: colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: verticalValue(44),
                                    width: horizontalValue(44),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    top: 70,
                    child: SizedBox(
                      width: horizontalValue(1),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalValue(25),
                              vertical: verticalValue(30),
                            ),
                            child: Container(
                              height: verticalValue(150),
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.dropShadow,
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                    offset: const Offset(
                                      0,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                                color: colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 50,
                                    color: colors.primaryColor,
                                  ),
                                  // verticalSpacer(10),
                                  // Image.asset(
                                  //   assets.icSchoolDark,
                                  //   height: 50,
                                  //   width: 50,
                                  // ),
                                  verticalSpacer(10),
                                  Text(
                                    widget.transactionDetailModel.school!.name,
                                    textAlign: TextAlign.center,
                                    style: textStyles.bold.copyWith(
                                      color: colors.black,
                                      fontSize: sizes.fontRatio * 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: verticalValue(10),
                                  ),
                                  Text(
                                    DateFormat("yyyy-MM-dd")
                                        .format(
                                          widget.transactionDetailModel.payedOn,
                                        )
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: textStyles.semiBold.copyWith(
                                      fontSize: sizes.fontRatio * 14,
                                      color: colors.textGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 18,
                          //   child: CircleAvatar(
                          //     radius: 40,
                          //     backgroundColor: colors.blueAccent,
                          //     child: CircleAvatar(
                          //       backgroundImage: registerResponseModel
                          //                   .parent!.profileImage ==
                          //               null
                          //           ? const NetworkImage(
                          //               'https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg',
                          //             )
                          //           : NetworkImage(
                          //               registerResponseModel
                          //                       .parent!.profileImage ??
                          //                   '',
                          //             ),
                          //       radius: 45,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                    // )
                    )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListTile(
                    //   onTap: () {
                    //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoicePaymentPage(singleStudentModel: widget.singleStudentModel)));
                    //   },
                    //   title: Text(
                    //     feepayment,
                    //     style: textStyles.bold.copyWith(
                    //       color: colors.black,
                    //       fontSize: sizes.fontRatio * 16,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     payment,
                    //     style: textStyles.bold.copyWith(
                    //       color: colors.primaryColor,
                    //       fontSize: sizes.fontRatio * 12,
                    //     ),
                    //   ),
                    //   trailing: SvgPicture.asset(assets.icArrowNext),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //     side: BorderSide(
                    //       width: 1,
                    //       color: colors.greyLite3,
                    //     ),
                    //   ),
                    // ),

                    /// Title
                    Text(
                      studentName,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: colors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: verticalValue(5),
                    ),
                    Text(
                      "${widget.transactionDetailModel.student!.firstName} ${widget.transactionDetailModel.student!.lastName != '-' ? widget.transactionDetailModel.student!.lastName : ''}",
                      style: textStyles.bold.copyWith(
                        color: colors.textGrey,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(12),
                      ),
                      child: Container(
                        // width: horizontalValue(1),
                        height: verticalValue(1),
                        color: colors.textGrey,
                      ),
                    ),
                    widget.transactionDetailModel.student!.grade != '-'
                        ? Text(
                            studentClass,
                            style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: colors.primaryColor),
                          )
                        : const SizedBox.shrink(),
                    widget.transactionDetailModel.student!.grade != '-'
                        ? SizedBox(
                            height: verticalValue(5),
                          )
                        : const SizedBox.shrink(),
                    widget.transactionDetailModel.student!.grade != '-'
                        ? Text(
                            "Grade ${widget.transactionDetailModel.student!.grade}",
                            style: textStyles.bold.copyWith(
                              color: colors.textGrey,
                              fontSize: sizes.fontRatio * 16,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.transactionDetailModel.student!.grade != '-'
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: verticalValue(12),
                            ),
                            child: Container(
                              height: verticalValue(1),
                              color: colors.textGrey,
                            ),
                          )
                        : const SizedBox.shrink(),

                    Text(
                      studentID,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: colors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: verticalValue(5),
                    ),
                    Text(
                      widget.transactionDetailModel.studentId.toString(),
                      style: textStyles.bold.copyWith(
                        color: colors.textGrey,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(12),
                      ),
                      child: Container(
                        height: verticalValue(1),
                        color: colors.textGrey,
                      ),
                    ),

                    Text(
                      referenceNumber,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: colors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: verticalValue(5),
                    ),
                    Text(
                      widget.transactionDetailModel.refNo.toString(),
                      style: textStyles.bold.copyWith(
                        color: colors.textGrey,
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(12),
                      ),
                      child: Container(
                        height: verticalValue(1),
                        color: colors.textGrey,
                      ),
                    ),

                    Text(
                      amountPaid,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: colors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: verticalValue(5),
                    ),
                    Text(
                      'AED ${amountFormater(
                        double.parse(
                          widget.transactionDetailModel.amount.toString(),
                        ),
                      )}',
                      style: textStyles.bold.copyWith(
                        color: colors.black,
                        fontSize: sizes.fontRatio * 22,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: verticalValue(16),
                      ),
                      child: Container(
                        width: horizontalValue(1),
                        height: verticalValue(1),
                        color: colors.white,
                      ),
                    ),

                    verticalSpacer(30),

                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primaryColor,
                          elevation: 0,
                          // side: BorderSide(width:1, color:Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: Text(
                          done,
                          style: textStyles.semiBold.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
