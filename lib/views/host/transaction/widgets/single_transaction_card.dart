import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/model/transactionlist_resp_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../constants/constants.dart';
import '../../../../main.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/inkwell_widget.dart';

class SingleTransaction extends StatelessWidget {
  const SingleTransaction({
    Key? key,
    required this.transactionList,
    required this.onTap,
  }) : super(key: key);

  final List<TransactionsRow> transactionList;
  final Function(TransactionsRow transactionsRow) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _singleContainer(transactionsRow: transactionList[index]);
      },
      separatorBuilder: (context, index) {
        return verticalSpacer(16);
      },
      itemCount: transactionList.length,
    );
  }

  Widget _singleContainer({required TransactionsRow transactionsRow}){
    return InkWellWidget(
      onTap: ()=> onTap(transactionsRow),
      child: Container(
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
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transactionsRow.school?.name}',
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio*13,
                      color: PayNestTheme.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    '${dateFormat.format(DateTime.parse(transactionsRow.payedOn.toString().substring(0, 10)))}',
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio*10,
                      color: PayNestTheme.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              'AED ${transactionsRow.amount}',
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio*13,
                color: PayNestTheme.primaryColor,
              ),
            ),
            horizontalSpacer(16),
            Lottie.asset(
              arrowForwardAnimation,
              repeat: true,
              width: sizes.widthRatio * 18,
              height: sizes.heightRatio * 18,
            ),
          ],
        ),
      ),
    );
  }
}
