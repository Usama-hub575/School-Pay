import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/model/transactionlist_resp_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../theme/theme.dart';

class SingleTransaction extends StatelessWidget {
  const SingleTransaction({
    Key? key,
    required this.transactionList,
  }) : super(key: key);

  final List<TransactionsRow> transactionList;

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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
        vertical: verticalValue(12),
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
                '${transactionsRow.school?.name}',
                style: PayNestTheme.h2_12blueAccent.copyWith(
                  fontSize: sizes.fontRatio*14,
                  color: PayNestTheme.black,
                ),
              ),
              verticalSpacer(8),
              Text(
                '${DateFormat("yyyy-MM-dd").format(transactionsRow.payedOn)}',
                style: PayNestTheme.h2_12blueAccent.copyWith(
                  fontSize: sizes.fontRatio*12,
                  color: PayNestTheme.textGrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'AED ${transactionsRow.amount}',
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio*14,
              color: PayNestTheme.primaryColor,
            ),
          ),
          horizontalSpacer(16),
          Container(
            height: sizes.heightRatio * 20,
            width: sizes.heightRatio * 20,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                color: PayNestTheme.colorWhite,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
