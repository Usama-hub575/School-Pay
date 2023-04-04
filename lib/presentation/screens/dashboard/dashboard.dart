import 'package:get/get.dart';
import 'package:paynest_flutter_app/data/model/datamodel/single_student_model.dart';
import 'package:paynest_flutter_app/data/model/datamodel/single_student_model.dart'
    as student;
import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/pendingtask/pending_task.dart';
import 'package:paynest_flutter_app/views/host/singlestudent/singlestudent_page.dart';
import 'package:paynest_flutter_app/views/host/student/student_page.dart';

import '../../../data/model/datamodel/single_student_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
    // required this.onTap,
    // required this.onRecentTransactionTap,
  }) : super(key: key);

  // final Function onTap;
  // final Function onRecentTransactionTap;

  static void onNotificationClick(
    context,
    String id,
  ) {
    if (id != '') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SingleStudentPage(
            studentId: id,
            myStudentsRespModel: MyStudentsResponseModel.empty(),
          ),
        ),
      );
    }
  }

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    userController = Get.put(
      UserController(),
    );
    context.read<DashboardBloc>().add(
          GetName(),
        );
    context.read<DashboardBloc>().add(
          FetchStudents(),
        );
    context.read<DashboardBloc>().add(
          FetchTransactions(),
        );
    // userController.init(
    //   context: context,
    // );
  }

  // fetchStudents() async {
  //   await myStudentController.hitMyStudents(
  //     userController.userResData.value.parent!.id,
  //   );
  // }
  //
  // fetchTransactions() async {
  //   await transactionListController.hitTransaction(
  //     userController.userResData.value.parent!.id.toString(),
  //   );
  //   isLoading = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: sizes.heightRatio * 154,
                decoration: BoxDecoration(
                  color: colors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(
                      24,
                    ),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacer(24),
                            Image.asset(
                              AppAssets().welcomeRegisterLogo,
                              width: sizes.widthRatio * 70,
                              color: colors.white,
                            ),
                            verticalSpacer(0.5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  welcomeBack,
                                  style: textStyles.regular.copyWith(
                                    fontSize: sizes.fontRatio * 14,
                                    color: colors.white,
                                  ),
                                ),
                                Text(
                                  '${state.firstName} ${state.lastName}',
                                  style: textStyles.semiBold.copyWith(
                                    fontSize: sizes.fontRatio * 18,
                                    color: colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            verticalSpacer(36),
                            Container(
                              height: sizes.heightRatio * 46,
                              width: sizes.widthRatio * 62,
                              decoration: BoxDecoration(
                                color: colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.black.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: const Offset(
                                      1.3, // Move to right 10  horizontally
                                      1.3, // Move to bottom 10 Vertically
                                    ),
                                  ),
                                ],
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(12),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const GetAssistancePage(),
                                    ),
                                  );
                                },
                                icon: Lottie.asset(
                                  AppAssets().supportAnimation,
                                  repeat: true,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpacer(9),
              state.isLoading
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FadeShimmer(
                                width: sizes.widthRatio * 55,
                                height: sizes.heightRatio * 20,
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: const Color(0xFFF4F4F4),
                                radius: 10,
                              ),
                              const Spacer(),
                              FadeShimmer(
                                width: sizes.widthRatio * 55,
                                height: sizes.heightRatio * 20,
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: const Color(0xFFF4F4F4),
                                radius: 10,
                              ),
                            ],
                          ),
                          verticalSpacer(8),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      child: Row(
                        children: [
                          Text(
                            students,
                            style: textStyles.bold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              context.read<HostPageBloc>().add(
                                    ChangePage(
                                      status: HostPageStatus.studentPage,
                                    ),
                                  );
                            },
                            child: Text(
                              showAll,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 10,
                                color: colors.textGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              verticalSpacer(8),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(
                        20,
                      ),
                      vertical: verticalValue(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.isLoading
                            ? Row(
                                children: [
                                  const ShimmerStudentCard(),
                                  horizontalSpacer(10),
                                  const ShimmerStudentCard(),
                                  horizontalSpacer(10),
                                  const ShimmerStudentCard(),
                                ],
                              )
                            : state.students.isNotEmpty
                                ? StudentCard(
                                    students: state.students,
                                    onTap: (student) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SingleStudentPage(
                                            studentId:
                                                student.studentId.toString(),
                                            myStudentsRespModel:
                                                getMyStudentModel(
                                              element: student,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox.shrink(),
                        verticalSpacer(16),
                        state.isLoading
                            ? FadeShimmer(
                                width: double.infinity,
                                height: sizes.heightRatio * 50,
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: const Color(0xFFF4F4F4),
                                radius: 18,
                              )
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.primaryColor,
                                    elevation: 0,
                                    // side: BorderSide(width:1, color:Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: verticalValue(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const SelectSchool(),
                                    //   ),
                                    // );
                                    // AddStudentBottomSheet.show(
                                    //   context: context,
                                    // );
                                  },
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: colors.white,
                                              width: 2,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: colors.white,
                                            ),
                                          ),
                                        ),
                                        horizontalSpacer(10),
                                        Text(
                                          addStudent,
                                          style: textStyles.bold.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: colors.white,
                                            fontSize: sizes.fontRatio * 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        verticalSpacer(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.isLoading
                                ? FadeShimmer(
                                    width: sizes.widthRatio * 55,
                                    height: sizes.heightRatio * 20,
                                    baseColor: const Color(0xFFEBEBF4),
                                    highlightColor: const Color(0xFFF4F4F4),
                                    radius: 10,
                                  )
                                : Text(
                                    pendingTask,
                                    style: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 16,
                                      color: colors.black,
                                    ),
                                  ),
                            state.isLoading
                                ? FadeShimmer(
                                    width: sizes.widthRatio * 55,
                                    height: sizes.heightRatio * 20,
                                    baseColor: const Color(0xFFEBEBF4),
                                    highlightColor: const Color(0xFFF4F4F4),
                                    radius: 10,
                                  )
                                : InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PendingTask(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      showAll,
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 10,
                                        color: colors.textGrey,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        verticalSpacer(10),

                        state.registerResponseModel.parent?.pin == null
                            ? SizedBox(
                                height: sizes.heightRatio * 48,
                                width: sizes.widthRatio * 326,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const ChangePIN(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        setPIN,
                                        style: textStyles.bold.copyWith(
                                          color: colors.black,
                                          fontSize: sizes.fontRatio * 10,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        AppAssets().arrowNext,
                                        height: sizes.heightRatio * 20,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        verticalSpacer(10),
                        state.isLoading
                            ? FadeShimmer(
                                width: double.infinity,
                                height: sizes.heightRatio * 50,
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: const Color(0xFFF4F4F4),
                                radius: 18,
                              )
                            : state.registerResponseModel.parent
                                            ?.paymentConfigured ==
                                        null ||
                                    state.registerResponseModel.parent!
                                        .paymentConfigured
                                        .toString()
                                        .isEmpty
                                ? InkWellWidget(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => StudentPage(
                                            whichStack: "other",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(12),
                                        vertical: verticalValue(12),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          18,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(
                                              0,
                                              1,
                                            ),
                                          ),
                                        ],
                                        color: colors.whiteShade,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            makeFirstPayment,
                                            style: TextStyles()
                                                .regular
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: colors.black,
                                                ),
                                          ),
                                          Lottie.asset(
                                            AppAssets().arrowForwardAnimation,
                                            repeat: true,
                                            width: sizes.widthRatio * 22,
                                            height: sizes.heightRatio * 22,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                        verticalSpacer(10),
                        // SizedBox(height: 10.5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(
                              15,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              state.isLoading
                                  ? FadeShimmer(
                                      width: sizes.widthRatio * 150,
                                      height: sizes.heightRatio * 20,
                                      baseColor: const Color(0xFFEBEBF4),
                                      highlightColor: const Color(0xFFF4F4F4),
                                      radius: 10,
                                    )
                                  : Text(
                                      recentTransactions,
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        color: colors.black,
                                      ),
                                    ),
                              state.isLoading
                                  ? FadeShimmer(
                                      width: sizes.widthRatio * 55,
                                      height: sizes.heightRatio * 20,
                                      baseColor: const Color(0xFFEBEBF4),
                                      highlightColor: const Color(0xFFF4F4F4),
                                      radius: 10,
                                    )
                                  : InkWellWidget(
                                      onTap: () {
                                        context.read<HostPageBloc>().add(
                                              ChangePage(
                                                status: HostPageStatus
                                                    .recentTransactionPage,
                                              ),
                                            );
                                      },
                                      child: Text(
                                        showAll,
                                        style: textStyles.bold.copyWith(
                                          fontSize: sizes.fontRatio * 10,
                                          color: colors.textGrey,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        verticalSpacer(8),
                        state.isLoading
                            ? FadeShimmer(
                                width: double.infinity,
                                height: sizes.heightRatio * 150,
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor: const Color(0xFFF4F4F4),
                                radius: 18,
                              )
                            : state.transactionListResponseModel.transactions !=
                                    null
                                ? RecentTransactions(
                                    transactions: state
                                        .transactionListResponseModel
                                        .transactions!,
                                    onTap: (transactionRow) {
                                      onTap(row: transactionRow);
                                    },
                                  )
                                : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        switch (state.status) {
          case DashboardStatus.init:
            break;
          case DashboardStatus.loading:
            // TODO: Handle this case.
            break;
          case DashboardStatus.loaded:
            // TODO: Handle this case.
            break;
          case DashboardStatus.error:
            showToast(
              message: state.errorMessage,
              context: context,
              color: colors.redShade2,
            );
            break;
        }
      },
    );
  }

  SingleStudentModel getStudentModel({
    required StudentData studentElement,
  }) {
    return SingleStudentModel(
      id: studentElement.id,
      parentId: studentElement.parentId,
      studentId: studentElement.studentId,
      deletedAt: studentElement.deletedAt,
      createdAt: studentElement.createdAt,
      updatedAt: studentElement.updatedAt,
      student: student.Student(
        dob: studentElement.student!.dob,
        admissionDate: studentElement.student!.admissionDate,
        id: studentElement.student!.id,
        studentRegNo: studentElement.student!.studentRegNo,
        firstName: studentElement.student!.firstName,
        lastName: studentElement.student!.lastName,
        grade: studentElement.student!.grade,
        parentEmiratesId: studentElement.student!.parentEmiratesId,
        parentPhoneNumber: studentElement.student!.parentPhoneNumber,
        deletedAt: studentElement.student!.deletedAt,
        schoolId: studentElement.student!.schoolId,
        totalBalanceAmount:
            double.parse(studentElement.student!.totalBalanceAmount.toString()),
        guardianFirstName: studentElement.student!.guardianFirstName,
        guardianLastName: studentElement.student!.guardianLastName,
        guardianGender: studentElement.student!.guardianGender,
        guardianEmiratesId: studentElement.student!.guardianEmiratesId,
        guardianNationality: studentElement.student!.guardianNationality,
        guardianReligion: studentElement.student!.guardianReligion,
        area: studentElement.student!.area,
        region: studentElement.student!.region,
        streetAddress: studentElement.student!.streetAddress,
        email: studentElement.student!.email,
        phoneNumber: studentElement.student!.phoneNumber,
        otherNumber: studentElement.student!.otherNumber,
        profile: studentElement.student!.profile,
        religion: studentElement.student!.religion,
        nationality: studentElement.student!.nationality,
        gender: studentElement.student!.gender,
        dueDate: studentElement.student!.dueDate,
        file: studentElement.student!.file,
        privacy: studentElement.student!.privacy,
        createdAt: studentElement.student!.createdAt,
        updatedAt: studentElement.student!.updatedAt,
        school: student.School(
          id: studentElement.student!.school!.id,
          name: studentElement.student!.school!.name,
          deletedAt: studentElement.student!.school!.deletedAt,
          addedBy: studentElement.student!.school!.addedBy,
          address: studentElement.student!.school!.address,
          description: studentElement.student!.school!.description,
          vat: studentElement.student!.school!.vat,
          paynestFee: studentElement.student!.school!.paynestFee,
          apiKey: studentElement.student!.school!.apiKey,
          merchantId: studentElement.student!.school!.merchantId,
          file: studentElement.student!.school!.file,
          privacy: studentElement.student!.school!.privacy,
          createdAt: studentElement.student!.school!.createdAt,
          updatedAt: studentElement.student!.school!.updatedAt,
        ),
      ),
    );
  }

  void onTap({required TransactionsRow row}) {
    TransactionDetailModel tdm = TransactionDetailModel(
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
        updatedAt: row.student!.updatedAt,
      ),
    );

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => TransactionDetailsPage(
    //       tdm: tdm,
    //     ),
    //   ),
    // );
  }

  void navigateToSingleStudentScreen({required String id}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleStudentPage(
          studentId: id,
          myStudentsRespModel: MyStudentsResponseModel.empty(),
        ),
      ),
    );
  }
}
