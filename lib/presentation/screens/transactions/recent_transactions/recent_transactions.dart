import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

class RecentTransactionPage extends StatefulWidget {
  final String whichStack;

  const RecentTransactionPage({required this.whichStack, Key? key})
      : super(key: key);

  @override
  State<RecentTransactionPage> createState() => _RecentTransactionPageState();
}

class _RecentTransactionPageState extends State<RecentTransactionPage> {
  DateFormat dateFormat = DateFormat.yMMMMd('en_GB');

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(
          FetchTransactions(),
        );

    Future.delayed(
      Duration.zero,
      () {
        initializeDateFormatting();
        dateFormat;
      },
    );
  }

  // fetchTransactions() async {
  //   shimmerValue = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   await transactionListController.hitTransaction(
  //     userController.userResData.value.parent?.id.toString(),
  //   );
  //
  //   shimmerValue = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }
  //
  // getValue() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   loaderValue = (preferences.getInt('showLoader')) ?? 0;
  //   if (loaderValue != 1) {
  //     shimmerValue = true;
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   }
  // }

  // void storeLoaderVal() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setInt('showLoader', 1);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: sizes.heightRatio * 140,
            decoration: BoxDecoration(
              color: colors.primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: widget.whichStack == "other" ? horizontalValue(25) : 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpacer(24),
                  Row(
                    mainAxisAlignment: widget.whichStack == "other"
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      widget.whichStack == "other"
                          ? Container(
                              height: verticalValue(44),
                              width: horizontalValue(44),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.black,
                                    blurRadius: 2.0,
                                    offset: const Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  ),
                                ],
                                color: colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  context.read<HostBloc>().add(
                                        ChangePageIndex(
                                          stack: "host",
                                          pageIndex: 0,
                                        ),
                                      );
                                },
                                icon: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: colors.blueAccent,
                                ),
                                // child: Text(""),
                              ),
                            )
                          : const SizedBox(),
                      Text(
                        transactions,
                        textAlign: TextAlign.center,
                        style: textStyles.bold.copyWith(
                          color: colors.white,
                          fontSize: sizes.fontRatio * 18,
                        ),
                      ),
                      widget.whichStack == "other"
                          ? SizedBox(
                              height: verticalValue(44),
                              width: horizontalValue(44),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return state.showShimmer &&
                      state.transactionListResponseModel.transactions!.count < 1
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(32),
                                ),
                                child: Row(
                                  children: [
                                    FadeShimmer(
                                      width: sizes.widthRatio * 120,
                                      height: sizes.heightRatio * 20,
                                      baseColor: const Color(0xFFEBEBF4),
                                      highlightColor: const Color(0xFFF4F4F4),
                                      radius: 10,
                                    ),
                                    horizontalSpacer(8),
                                    const Expanded(
                                      child: FadeShimmer(
                                        height: 1,
                                        width: double.infinity,
                                        baseColor: Color(0xFFEBEBF4),
                                        highlightColor: Color(0xFFF4F4F4),
                                        // radius: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpacer(12),
                              const TransactionShimmerCard(),
                              verticalSpacer(12),
                            ],
                          );
                        },
                      ),
                    )
                  : state.transactionListResponseModel.transactions!.rows!
                          .isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              String key = state.list.keys.elementAt(index);
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          dateFormat.format(
                                            DateTime.parse(
                                              key,
                                            ),
                                          ),
                                          style: textStyles.bold.copyWith(
                                            fontSize: sizes.fontRatio * 16,
                                            color: colors.black,
                                          ),
                                        ),
                                        horizontalSpacer(8),
                                        Expanded(
                                          child: Container(
                                            height: 1,
                                            color: colors.textGrey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  verticalSpacer(12),
                                  SingleTransaction(
                                    transactionList: state.list[key],
                                    onTap: (transactionRow) {
                                      onTap(
                                        row: transactionRow,
                                      );
                                    },
                                  ),
                                  verticalSpacer(12),
                                ],
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalValue(16),
                            ),
                            child: Column(
                              children: [
                                verticalSpacer(100),
                                Container(
                                  width: sizes.widthRatio * 150,
                                  height: sizes.heightRatio * 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        assets.noData,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                verticalSpacer(20),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    noDataText,
                                    style: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 22,
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                ),
                                verticalSpacer(10),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    sorryWeCant,
                                    textAlign: TextAlign.center,
                                    style: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 16,
                                      color: colors.lightGreyShade,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                verticalSpacer(16),
                              ],
                            ),
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }

  void onTap({required TransactionsRow row}) {
    TransactionDetailModel transactionDetailModel = TransactionDetailModel(
      id: row.id,
      schoolId: row.schoolId,
      parentId: row.parentId,
      invoiceId: row.invoiceId,
      studentId: row.studentId,
      payedOn: row.payedOn,
      amount: row.amount,
      deletedAt: row.deletedAt,
      refNo: row.refNo,
      type: row.type,
      vat: row.vat,
      paynestFee: row.paynestFee,
      country: row.country,
      bankResponse: row.bankResponse,
      amountToPay: row.amountToPay,
      stringToBank: row.stringToBank,
      stringFromBank: row.stringFromBank,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      school: TransactionDetailSchool(
          id: row.school!.id,
          name: row.school!.name,
          deletedAt: row.school!.deletedAt,
          addedBy: row.school!.addedBy,
          address: row.school!.address,
          description: row.school!.description,
          vat: row.school!.vat,
          paynestFee: row.school!.paynestFee,
          apiKey: row.school!.apiKey,
          merchantId: row.school!.merchantId,
          file: row.school!.file,
          privacy: row.school!.privacy,
          createdAt: row.school!.createdAt,
          updatedAt: row.school!.updatedAt),
      student: TransactionDetailStudent(
          dob: row.student!.dob,
          admissionDate: row.student!.admissionDate,
          id: row.student!.id,
          studentRegNo: row.student!.studentRegNo,
          firstName: row.student!.firstName,
          lastName: row.student!.lastName,
          grade: row.student!.grade,
          parentEmiratesId: row.student!.parentEmiratesId,
          parentPhoneNumber: row.student!.parentPhoneNumber,
          deletedAt: row.student!.deletedAt,
          schoolId: row.student!.schoolId,
          totalBalanceAmount: row.student!.totalBalanceAmount,
          guardianFirstName: row.student!.guardianFirstName,
          guardianLastName: row.student!.guardianLastName,
          guardianGender: row.student!.guardianGender,
          guardianEmiratesId: row.student!.guardianEmiratesId,
          guardianNationality: row.student!.guardianNationality,
          guardianReligion: row.student!.guardianReligion,
          area: row.student!.area,
          region: row.student!.region,
          streetAddress: row.student!.streetAddress,
          email: row.student!.email,
          phoneNumber: row.student!.phoneNumber,
          otherNumber: row.student!.otherNumber,
          profile: row.student!.profile,
          religion: row.student!.religion,
          nationality: row.student!.nationality,
          gender: row.student!.gender,
          dueDate: row.student!.dueDate,
          file: row.student!.file,
          privacy: row.student!.privacy,
          createdAt: row.student!.createdAt,
          updatedAt: row.student!.updatedAt),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionDetailsPage(
          transactionDetailModel: transactionDetailModel,
        ),
      ),
    );
  }
}
