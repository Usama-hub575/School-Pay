import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

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

  Widget _singleContainer({required TransactionsRow transactionsRow}) {
    late DateFormat dateFormat;
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('en_GB');
    return InkWellWidget(
      onTap: () => onTap(transactionsRow),
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
          color: colors.white,
          border: Border.all(
            color: colors.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.greyShade.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transactionsRow.school?.name}',
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: colors.black,
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    dateFormat.format(DateTime.parse(
                        transactionsRow.payedOn.toString().substring(0, 10))),
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      color: colors.textGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'AED ${transactionsRow.amount}',
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 13,
                color: colors.primaryColor,
              ),
            ),
            horizontalSpacer(16),
            Lottie.asset(
              AppAssets().arrowForwardAnimation,
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
