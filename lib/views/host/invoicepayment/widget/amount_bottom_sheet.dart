import 'package:flutter/material.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/amount_formater.dart';

import '../../../../constants/constants.dart';
import '../../../../data/model/datamodel/singlestudent_model.dart';
import '../../../../presentation/res/res.dart';
import '../../../../widgets/spacer.dart';

class AmountBottomSheet {
  static void show({
    required BuildContext context,
    required Function(int value) onTap,
    required SingleStudentModel singleStudentModel,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AmountWidget(
          onTap: (int value) => onTap(value),
          singleStudentModel: singleStudentModel,
        );
      },
    );
  }
}

class AmountWidget extends StatefulWidget {
  AmountWidget({
    required this.onTap,
    required this.singleStudentModel,
  });

  final Function(int value) onTap;
  final SingleStudentModel singleStudentModel;

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  TextEditingController _enterAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    _enterAmount.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: PayNestTheme.black.withOpacity(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                color: PayNestTheme.colorWhite,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpacer(36),
                      Text(
                        enterAmount,
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                        ),
                      ),
                      verticalSpacer(24),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Current Payable Amount',
                              style: PayNestTheme.h2_12blueAccentLight.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: PayNestTheme.primaryColor,
                                fontFamily: 'montserratSemiBold',
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'AED ${amountFormater(
                                double.parse(
                                  widget.singleStudentModel.student!
                                      .totalBalanceAmount
                                      .toString(),
                                ),
                              )}',
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: PayNestTheme.primaryColor,
                                fontFamily: 'montserratExtraBold',
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(6),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: PayNestTheme.textGrey.withOpacity(0.5),
                      ),
                      verticalSpacer(16),
                      TextFormField(
                        controller: _enterAmount,
                        keyboardType: TextInputType.number,
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.black,
                          fontFamily: 'montserratExtraBold',
                        ),
                        decoration: InputDecoration(
                          suffix: Text(
                            'AED',
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                              fontFamily: 'montserratExtraBold',
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          labelText: payableAmount,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.primaryColor.withOpacity(
                                0.5,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PayNestTheme.colorWhite,
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
                            if (_enterAmount.text.isNotEmpty) {
                              widget.onTap(
                                int.parse(
                                  _enterAmount.text,
                                ),
                              );
                            }
                          },
                          child: Center(
                            child: Text(
                              continueTo,
                              style:
                                  PayNestTheme.title_2_16primaryColor.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: sizes.fontRatio * 14,
                                color: PayNestTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
