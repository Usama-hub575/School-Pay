import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart'
    as add_student;

class SelectSchool extends StatefulWidget {
  const SelectSchool({Key? key}) : super(key: key);

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  // SchoolController schoolController = Get.put(SchoolController());
  TextEditingController searchSchoolController = TextEditingController();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    context.read<SchoolListBloc>().add(
          GetSchoolList(),
        );
    // schoolController.hitSchoolList();
  }

  // onSearchTextChanged(String text) async {
  //   _searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //
  //   schoolController.schoolResList.value.log!.forEach((schoolDetail) {
  //     if (schoolDetail.name.toUpperCase().contains(text.toUpperCase()) ||
  //         schoolDetail.address.toUpperCase().contains(text.toUpperCase())) {
  //       _searchResult.add(schoolDetail);
  //     }
  //   });
  //
  //   setState(() {});
  // }
  //
  // List<Log> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(16),
            ),
            decoration: BoxDecoration(
              color: colors.primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBarBackButton(
                          iconColor: colors.primaryColor,
                          buttonColor: colors.white,
                        ),
                        Text(
                          selectSchool,
                          style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 18,
                            color: colors.white,
                          ),
                        ),
                        SizedBox(
                          height: verticalValue(44),
                          width: horizontalValue(44),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpacer(16),
          BlocBuilder<SchoolListBloc, SchoolListState>(
            builder: (context, state) {
              return state.status == SchoolListStatus.loading
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      child: FadeShimmer(
                        width: double.infinity,
                        height: sizes.heightRatio * 50,
                        // fadeTheme: FadeTheme.dark,
                        baseColor: colors.baseWhite,
                        highlightColor: colors.highlightWhite,
                        radius: 16,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(20),
                        vertical: verticalValue(10),
                      ),
                      child: SearchTextField(
                        controller: searchSchoolController,
                        onChanged: (value) {
                          context.read<SchoolListBloc>().add(
                                OnSearchChange(value: value),
                              );
                        },
                      ),
                    );
            },
          ),
          BlocBuilder<SchoolListBloc, SchoolListState>(
            builder: (context, state) {
              return state.status == SchoolListStatus.loading
                  ? Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                          vertical: verticalValue(12),
                        ),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FadeShimmer.round(
                                size: sizes.heightRatio * 50,
                                baseColor: colors.baseWhite,
                                highlightColor: colors.highlightWhite,
                              ),
                              horizontalSpacer(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpacer(10),
                                  FadeShimmer(
                                    width: sizes.widthRatio * 250,
                                    height: sizes.heightRatio * 20,
                                    baseColor: colors.white,
                                    highlightColor: colors.highlightWhite,
                                    radius: 8,
                                  ),
                                  verticalSpacer(8),
                                  FadeShimmer(
                                    width: sizes.widthRatio * 70,
                                    height: sizes.heightRatio * 20,
                                    baseColor: colors.baseWhite,
                                    highlightColor: colors.highlightWhite,
                                    radius: 10,
                                  ),
                                  verticalSpacer(6),
                                ],
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return FadeShimmer(
                            width: sizes.widthRatio * 250,
                            baseColor: colors.baseWhite,
                            highlightColor: colors.highlightWhite,
                            height: verticalValue(1),
                            // radius: 10,
                          );
                        },
                      ),
                    )
                  : state.searchResult.isNotEmpty ||
                          searchSchoolController.text.isNotEmpty
                      ? Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              state.searchResult.isEmpty &&
                                      searchSchoolController.text.isNotEmpty
                                  ? const NoDataText()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.searchResult.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            _singleCard(
                                              log: state.searchResult[index],
                                            ),
                                            verticalSpacer(8),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: horizontalValue(20),
                                              ),
                                              height: verticalValue(1),
                                              color: colors.textGrey,
                                            ),
                                          ],
                                        );
                                      },
                                    )
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.log.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _singleCard(
                                    log: state.log[index],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(20),
                                    ),
                                    height: verticalValue(1),
                                    color: colors.textGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
            },
          )
        ],
      ),
    );
  }

  Widget _singleCard({required Log log}) {
    return InkWell(
      onTap: () {
        SelectedSchoolData schoolData = SelectedSchoolData(
          id: log.id,
          name: log.name,
          deletedAt: log.deletedAt,
          addedBy: log.addedBy,
          address: log.address,
          description: log.description,
          vat: log.vat,
          paynestFee: log.paynestFee,
          apiKey: log.apiKey,
          merchantId: log.merchantId,
          file: log.file,
          privacy: log.privacy,
          createdAt: log.createdAt,
          updatedAt: log.updatedAt,
          payeeType: log.payeeType ?? '',
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => add_student.AddStudent(
              schoolData: schoolData,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                assets.icSchoolBuilding,
              ),
            ),
            horizontalSpacer(13),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log.name,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      fontWeight: FontWeight.bold,
                      color: colors.black,
                    ),
                  ),
                  Text(
                    log.address,
                    style: textStyles.bold.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      fontWeight: FontWeight.w300,
                      color: colors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
