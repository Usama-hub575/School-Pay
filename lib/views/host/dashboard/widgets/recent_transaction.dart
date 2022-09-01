import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../../main.dart';
import '../../../../model/transactionlist_resp_model.dart';
import '../../../../res/res.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({
    Key? key,
    required this.transactions,
    required this.onTap,
  }) : super(key: key);
  final Transactions? transactions;
  final Function(TransactionsRow transactionsRow) onTap;

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  bool isListEmpty = true;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    if (widget.transactions != null &&
        widget.transactions!.rows != null &&
        widget.transactions!.rows!.isNotEmpty) {
    } else {
      isListEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isListEmpty
        ? Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: PayNestTheme.colorDimPrimary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _singleCard(
                    transactionsRow: widget.transactions!.rows![index]);
              },
              separatorBuilder: (context, index) {
                return verticalSpacer(16);
              },
              itemCount: widget.transactions!.rows!.length > 3
                  ? 3
                  : widget.transactions!.rows!.length,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _singleCard({required TransactionsRow transactionsRow}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: InkWell(
        onTap: () => widget.onTap(transactionsRow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sizes.heightRatio * 23,
              width: sizes.heightRatio * 23,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: PayNestTheme.colorWhite,
                  size: 14,
                ),
              ),
            ),
            horizontalSpacer(16),
            Flexible(
              fit: FlexFit.loose,
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transactionsRow.school!.name}',
                    textAlign: TextAlign.start,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: PayNestTheme.black,
                      fontFamily: 'montserratBold',
                    ),
                  ),
                  Text(
                    '${dateFormat.format(DateTime.parse(transactionsRow.payedOn.toString().substring(0, 10)))}',
                    style: PayNestTheme.h2_12blueAccentLight.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: PayNestTheme.textGrey,
                      fontFamily: 'montserratRegular',
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              'AED ${transactionsRow.amount}',
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 13,
                color: PayNestTheme.blueAccent,
              ),
            ),
            horizontalSpacer(12),
          ],
        ),
      ),
    );
  }
}
