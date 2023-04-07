import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

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
  late DateFormat dateFormat;
  bool isListEmpty = true;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('en_GB');
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
            padding: EdgeInsets.only(
              bottom: verticalValue(20),
            ),
            decoration: BoxDecoration(
              color: colors.lightGrey1,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: colors.textGrey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: verticalValue(20),
              ),
              itemBuilder: (context, index) {
                return _singleCard(
                  transactionsRow: widget.transactions!.rows![index],
                );
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

  Widget _singleCard({
    required TransactionsRow transactionsRow,
  }) {
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
                color: colors.green2,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: colors.white,
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
                    transactionsRow.school!.name,
                    textAlign: TextAlign.start,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: colors.black,
                    ),
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(
                        transactionsRow.payedOn.toString().substring(0, 10))),
                    style: textStyles.regular.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: colors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'AED ${amountFormater(
                double.parse('${transactionsRow.amount}'),
              )}',
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 13,
                color: colors.blueAccent,
              ),
            ),
            horizontalSpacer(12),
          ],
        ),
      ),
    );
  }
}
