import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../../model/transactionlist_resp_model.dart';
import '../../../../res/res.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  final Transactions? transactions;

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  bool isListEmpty = true;
  @override
  void initState() {
    super.initState();
    if(widget.transactions!=null && widget.transactions!.rows!=null && widget.transactions!.rows!.isNotEmpty){
    }else{
      isListEmpty = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return isListEmpty ? Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: PayNestTheme.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _singleCard(
            transactionsRow: widget.transactions!.rows![index]
          );
        },
        separatorBuilder: (context, index) {
          return verticalSpacer(8);
        },
        itemCount: widget.transactions!.rows!.length > 3 ? 3 : widget.transactions!.rows!.length,
      ),
    ) : const SizedBox.shrink();
  }

  Widget _singleCard({required TransactionsRow transactionsRow}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          Container(
            height: sizes.heightRatio * 30,
            width: sizes.heightRatio * 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: PayNestTheme.colorWhite,
                size: 20,
              ),
            ),
          ),
          horizontalSpacer(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${transactionsRow.school!.name}',
                style: PayNestTheme.h2_12blueAccent.copyWith(
                  fontSize: sizes.fontRatio * 14,
                  color: PayNestTheme.black,
                ),
              ),
              Text(
                '${DateFormat("yyyy-MM-dd").format(transactionsRow.payedOn)}',
                style: PayNestTheme.h2_12blueAccentLight.copyWith(
                  fontSize: sizes.fontRatio * 12,
                  color: PayNestTheme.textGrey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'AED ${transactionsRow.amount}',
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio * 16,
              color: PayNestTheme.blueAccent,
            ),
          ),
          horizontalSpacer(12),
        ],
      ),
    );
  }
}
