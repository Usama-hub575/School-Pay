import 'package:paynest_flutter_app/export.dart';

class PayAbleAmountUI extends StatefulWidget {
  const PayAbleAmountUI({Key? key, required this.amount}) : super(key: key);

  final String amount;

  @override
  State<PayAbleAmountUI> createState() => _PayAbleAmountUIState();
}

class _PayAbleAmountUIState extends State<PayAbleAmountUI> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, dashboardState) {
        return BlocBuilder<PayNowBloc, PayNowState>(
          builder: (context, state) {
            return dashboardState.searchResult.isNotEmpty
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            currentPayableAmount,
                            style: textStyles.semiBold.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: colors.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          state.studentData.isSelected
                              ? Text(
                                  'AED ${state.payAbleAmount != '0' ? amountFormater(
                                      double.parse(state.payAbleAmount),
                                    ) : '0.0'}',
                                  style: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 16,
                                    color: colors.primaryColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          horizontalSpacer(16),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: verticalValue(1),
                        color: colors.textGrey.withOpacity(0.5),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Lottie.asset(
                          assets.singleStudentJson,
                          repeat: true,
                          height: state.payAbleAmount == '0'
                              ? sizes.heightRatio * 327
                              : sizes.heightRatio * 114,
                          width: state.payAbleAmount == '0'
                              ? sizes.widthRatio * 327
                              : sizes.widthRatio * 114,
                        ),
                      ),
                      verticalSpacer(16),
                      state.payAbleAmount != '0'
                          ? InkWellWidget(
                              onTap: () {
                                // onPress();
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(4),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: verticalValue(4),
                                ),
                                decoration: BoxDecoration(
                                  color: colors.white,
                                  border: Border.all(
                                    color: colors.primaryColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colors.greyShade.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 5,
                                      offset: const Offset(1, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    horizontalSpacer(16),
                                    CommercialImage(
                                      imagePath: assets.icCommercialBank,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          payBy,
                                          textAlign: TextAlign.center,
                                          style: textStyles.bold.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: sizes.fontRatio * 14,
                                            color: colors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpacer(16),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      verticalSpacer(8),
                      state.payAbleAmount != '0'
                          ? Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: verticalValue(2),
                                    color: colors.primaryColor,
                                  ),
                                ),
                                horizontalSpacer(10),
                                Text(
                                  or,
                                  style: textStyles.bold.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizes.fontRatio * 14,
                                    color: colors.black,
                                  ),
                                ),
                                horizontalSpacer(10),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: colors.primaryColor,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      verticalSpacer(8),
                      state.payAbleAmount != '0'
                          ? InkWellWidget(
                              onTap: () {
                                if (isLeanEnable) {
                                  if (int.parse(widget.amount) <= 0) {
                                    showToast(
                                      message: amountShouldBeGreaterThan0,
                                      context: context,
                                      color: colors.red,
                                    );
                                  } else {
                                    // onLeanPaymentTap();
                                  }
                                } else {
                                  showToast(
                                    message: serviceUnavailable,
                                    context: context,
                                    color: colors.primaryColor,
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(4),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: verticalValue(12),
                                ),
                                decoration: isLeanEnable
                                    ? BoxDecoration(
                                        color: colors.white,
                                        border: Border.all(
                                          color: colors.primaryColor,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: colors.greyShade.withOpacity(
                                              0.5,
                                            ),
                                            spreadRadius: 0.5,
                                            blurRadius: 5,
                                            offset: const Offset(
                                              1,
                                              3,
                                            ),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(
                                          16,
                                        ),
                                      )
                                    : BoxDecoration(
                                        color: colors.white,
                                        border: Border.all(
                                          color: colors.primaryColor,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 5,
                                            offset: const Offset(
                                              1,
                                              3,
                                            ),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(
                                          16,
                                        ),
                                      ),
                                child: Row(
                                  children: [
                                    horizontalSpacer(32),
                                    OtherImage(
                                      opacity: isLeanEnable ? 1 : 0.5,
                                      imagePath: assets.icLean,
                                    ),
                                    horizontalSpacer(16),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          payByBankTransfer,
                                          textAlign: TextAlign.center,
                                          style: isLeanEnable
                                              ? textStyles.bold.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: colors.primaryColor,
                                                )
                                              : textStyles.bold.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: colors.primaryColor
                                                      .withOpacity(
                                                    0.5,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpacer(16),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      verticalSpacer(16),
                    ],
                  )
                : const SizedBox.shrink();
          },
        );
      },
    );
  }
}
