import 'package:paynest_flutter_app/export.dart';

class PayNowTransactionDetailsPage extends StatefulWidget {
  final PayNowTransactionDetailModel payNowTransactionDetailModel;

  const PayNowTransactionDetailsPage({
    super.key,
    required this.payNowTransactionDetailModel,
  });

  @override
  State<PayNowTransactionDetailsPage> createState() =>
      _PayNowTransactionDetailsPageState();
}

class _PayNowTransactionDetailsPageState
    extends State<PayNowTransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: verticalValue(350),
            child: Stack(
              children: [
                Container(
                  height: verticalValue(210),
                  width: horizontalValue(1),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(
                        24,
                      ),
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
                          verticalSpacer(16),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Invoice Details',
                              textAlign: TextAlign.center,
                              style: textStyles.bold.copyWith(
                                color: colors.white,
                                fontSize: sizes.fontRatio * 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 90,
                  child: SizedBox(
                    width: horizontalValue(1),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalValue(25),
                              vertical: verticalValue(30)),
                          child: Container(
                            width: horizontalValue(1),
                            height: verticalValue(223),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: colors.lightGrey1,
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                              color: colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  assets.successCheckAnimation,
                                  height: sizes.heightRatio * 104,
                                  width: sizes.widthRatio * 104,
                                ),
                                Text(
                                  congratulations,
                                  style: textStyles.bold.copyWith(
                                    color: colors.primaryColor,
                                    fontSize: sizes.fontRatio * 22,
                                  ),
                                ),
                                verticalSpacer(8),
                                SizedBox(
                                  width: horizontalValue(1.4),
                                  child: Text(
                                    youHaveSuccessfully,
                                    textAlign: TextAlign.center,
                                    style: textStyles.regular.copyWith(
                                      fontSize: sizes.fontRatio * 14,
                                      color: colors.lightGreyShade,
                                    ),
                                  ),
                                ),
                                verticalSpacer(16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(32),
                  vertical: verticalValue(34),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studentName,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      (widget.payNowTransactionDetailModel.student?.firstName ??
                              '') +
                          (widget.payNowTransactionDetailModel.student
                                      ?.lastName !=
                                  '-'
                              ? widget.payNowTransactionDetailModel.student!
                                  .lastName
                              : ''),
                      style: textStyles.semiBold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: colors.lightGreyShade,
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    widget.payNowTransactionDetailModel.student!.grade != '-'
                        ? verticalSpacer(16)
                        : const SizedBox.shrink(),
                    widget.payNowTransactionDetailModel.student!.grade != '-'
                        ? Text(
                            studentClass,
                            style: textStyles.bold.copyWith(
                              color: colors.primaryColor,
                              fontSize: sizes.fontRatio * 12,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.payNowTransactionDetailModel.student!.grade != '-'
                        ? verticalSpacer(4)
                        : const SizedBox.shrink(),
                    widget.payNowTransactionDetailModel.student!.grade != '-'
                        ? Text(
                            "Grade ${widget.payNowTransactionDetailModel.student!.grade}",
                            style: textStyles.semiBold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: colors.lightGreyShade,
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(4),
                    widget.payNowTransactionDetailModel.student!.grade != '-'
                        ? Container(
                            width: horizontalValue(1),
                            height: verticalValue(1),
                            color: colors.white,
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(16),
                    Text(
                      studentID,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      widget.payNowTransactionDetailModel.student?.id
                              .toString() ??
                          '-',
                      style: textStyles.semiBold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: colors.lightGreyShade,
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    verticalSpacer(16),
                    Text(
                      referenceNumber,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      widget.payNowTransactionDetailModel.student?.studentRegNo
                              .toString() ??
                          '-',
                      style: textStyles.semiBold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: colors.lightGreyShade,
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    verticalSpacer(16),
                    Text(
                      schoolName,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      widget.payNowTransactionDetailModel.schoolName ?? '-',
                      style: textStyles.semiBold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: colors.lightGreyShade,
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    verticalSpacer(16),
                    Text(
                      amountPaid,
                      style: textStyles.bold.copyWith(
                        color: colors.primaryColor,
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    SizedBox(
                      height: verticalValue(5),
                    ),
                    Text(
                      'AED ${amountFormater(
                        double.parse(
                          widget.payNowTransactionDetailModel.amountPaid
                              .toString(),
                        ),
                      )}',
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 22,
                        color: colors.black,
                      ),
                    ),
                    verticalSpacer(20),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalValue(30)),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryColor,
                  elevation: 0,
                  side: BorderSide(
                    width: 1,
                    color: colors.primaryColor,
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/DashboardPage',
                    (Route<dynamic> route) => false,
                  );
                },
                child: Center(
                  child: Text(
                    done,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      color: colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          verticalSpacer(10)
        ],
      ),
    );
  }
}
