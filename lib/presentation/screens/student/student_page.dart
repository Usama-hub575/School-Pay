import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';

class StudentPage extends StatefulWidget {
  final String whichStack;

  const StudentPage({
    required this.whichStack,
    Key? key,
  }) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // final MyStudentController controller = Get.find<MyStudentController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        decoration: BoxDecoration(
          color: colors.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpacer(16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(40),
              ),
              child: Row(
                children: [
                  widget.whichStack == "other"
                      ? Container(
                          height: verticalValue(44),
                          width: horizontalValue(44),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: colors.lightGreyShade4,
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
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: colors.blueAccent,
                            ),
                            // child: Text(""),
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  Text(
                    student,
                    textAlign: TextAlign.center,
                    style: textStyles.bold.copyWith(
                      color: colors.white,
                      fontSize: sizes.fontRatio * 18,
                    ),
                  ),
                  horizontalSpacer(82),
                  InkWellWidget(
                    onTap: () {
                      // AddStudentBottomSheet.show(
                      //   context: context,
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SelectSchool(),
                        ),
                      );
                    },
                    child: Container(
                      height: sizes.heightRatio * 40,
                      width: sizes.widthRatio * 40,
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      child: Lottie.asset(
                        assets.addStudentAnimation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: colors.white,
                  ),
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      return state.myStudentsResponseModel.status
                          ? state.myStudentsResponseModel.students == null ||
                                  state
                                      .myStudentsResponseModel.students!.isEmpty
                              ? Container(
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
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacer(16),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(24),
                                      ),
                                      child: Text(
                                        selectStudent,
                                        style: textStyles.extraBold.copyWith(
                                          fontSize: sizes.fontRatio * 16,
                                          color: colors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleStudentCard(
                                        onTap: (student) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleStudentPage(
                                                studentId: student.studentId
                                                    .toString(),
                                                myStudentsResponseModel:
                                                    getMyStudentModel(
                                                  element: student,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        students: state
                                            .myStudentsResponseModel.students!,
                                      ),
                                    ),
                                  ],
                                )
                          : Container(
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
                                          assets.warning,
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
                                      error,
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
                            );
                    },
                  )
                  //       : Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: horizontalValue(16),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       verticalSpacer(16),
                  //       FadeShimmer(
                  //         width: sizes.widthRatio * 85,
                  //         height: sizes.heightRatio * 20,
                  //         baseColor: const Color(0xFFEBEBF4),
                  //         highlightColor: const Color(0xFFF4F4F4),
                  //         radius: 10,
                  //       ),
                  //       Expanded(
                  //         child: ListView.separated(
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           itemCount: 6,
                  //           itemBuilder: (context, index) {
                  //             return Container(
                  //               margin: EdgeInsets.symmetric(
                  //                 horizontal: horizontalValue(4),
                  //               ),
                  //               padding: EdgeInsets.symmetric(
                  //                 horizontal: horizontalValue(6),
                  //               ),
                  //               child: FadeShimmer(
                  //                 width: sizes.widthRatio * 10,
                  //                 height: sizes.heightRatio * 70,
                  //                 // fadeTheme: FadeTheme.dark,
                  //                 baseColor: const Color(0xFFEBEBF4),
                  //                 highlightColor: const Color(0xFFF4F4F4),
                  //                 radius: 16,
                  //               ),
                  //             );
                  //           },
                  //           separatorBuilder: (context, index) {
                  //             return verticalSpacer(6);
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

// SingleStudentModel getStudentModel({
//   required StudentElement studentElement,
// }) {
//   return SingleStudentModel(
//     id: studentElement.id,
//     parentId: studentElement.parentId,
//     studentId: studentElement.studentId,
//     deletedAt: studentElement.deletedAt,
//     createdAt: studentElement.createdAt,
//     updatedAt: studentElement.updatedAt,
//     student: Student(
//       dob: studentElement.student!.dob,
//       admissionDate: studentElement.student!.admissionDate,
//       id: studentElement.student!.id,
//       studentRegNo: studentElement.student!.studentRegNo,
//       firstName: studentElement.student!.firstName,
//       lastName: studentElement.student!.lastName,
//       grade: studentElement.student!.grade,
//       parentEmiratesId: studentElement.student!.parentEmiratesId,
//       parentPhoneNumber: studentElement.student!.parentPhoneNumber,
//       deletedAt: studentElement.student!.deletedAt,
//       schoolId: studentElement.student!.schoolId,
//       totalBalanceAmount:
//       double.parse(studentElement.student!.totalBalanceAmount.toString()),
//       guardianFirstName: studentElement.student!.guardianFirstName,
//       guardianLastName: studentElement.student!.guardianLastName,
//       guardianGender: studentElement.student!.guardianGender,
//       guardianEmiratesId: studentElement.student!.guardianEmiratesId,
//       guardianNationality: studentElement.student!.guardianNationality,
//       guardianReligion: studentElement.student!.guardianReligion,
//       area: studentElement.student!.area,
//       region: studentElement.student!.region,
//       streetAddress: studentElement.student!.streetAddress,
//       email: studentElement.student!.email,
//       phoneNumber: studentElement.student!.phoneNumber,
//       otherNumber: studentElement.student!.otherNumber,
//       profile: studentElement.student!.profile,
//       religion: studentElement.student!.religion,
//       nationality: studentElement.student!.nationality,
//       gender: studentElement.student!.gender,
//       dueDate: studentElement.student!.dueDate,
//       file: studentElement.student!.file,
//       privacy: studentElement.student!.privacy,
//       createdAt: studentElement.student!.createdAt,
//       updatedAt: studentElement.student!.updatedAt,
//       school: School(
//         id: studentElement.student!.school!.id,
//         name: studentElement.student!.school!.name,
//         deletedAt: studentElement.student!.school!.deletedAt,
//         addedBy: studentElement.student!.school!.addedBy,
//         address: studentElement.student!.school!.address,
//         description: studentElement.student!.school!.description,
//         vat: studentElement.student!.school!.vat,
//         paynestFee: studentElement.student!.school!.paynestFee,
//         apiKey: studentElement.student!.school!.apiKey,
//         merchantId: studentElement.student!.school!.merchantId,
//         file: studentElement.student!.school!.file,
//         privacy: studentElement.student!.school!.privacy,
//         createdAt: studentElement.student!.school!.createdAt,
//         updatedAt: studentElement.student!.school!.updatedAt,
//       ),
//     ),
//   );
// }
}
