import 'package:get/get.dart';
import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/invoice_payment_page.dart';

import '../../../data/model/datamodel/single_student_model.dart'
    as single_student_model;

class SingleStudentPage extends StatefulWidget {
  const SingleStudentPage({
    Key? key,
    required this.studentId,
    required this.myStudentsResponseModel,
  }) : super(key: key);

  final MyStudentsResponseModel myStudentsResponseModel;
  final String studentId;

  @override
  State<SingleStudentPage> createState() => _SingleStudentPageState();
}

class _SingleStudentPageState extends State<SingleStudentPage> {
  final UserController userController = Get.find<UserController>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().state.myStudentsResponseModel =
        widget.myStudentsResponseModel;
    context.read<DashboardBloc>().add(
          GetStudentByID(
            userID: widget.studentId,
          ),
        );
    // getStudentByStudentId();
  }

  // void getStudentByStudentId() async {
  //   print('${widget.myStudentsResponseModel}');
  //   await userController.getStudentById(
  //     widget.studentId.toString(),
  //   );
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.white,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              horizontalValue(14),
            ),
            topRight: Radius.circular(
              horizontalValue(14),
            ),
          ),
          color: colors.white,
        ),
        child: Stack().fullScreenLoader(
          state: isLoading,
          loadingWidget: fullScreenLoader(),
          child: Scaffold(
            body: Container(
              height: sizes.height,
              decoration: BoxDecoration(
                color: colors.primaryColor,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      verticalSpacer(32),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                          vertical: verticalValue(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBarBackButton(
                              iconColor: colors.primaryColor,
                              buttonColor: colors.white,
                            ),
                            Text(
                              studentDetails,
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
                      ),
                      verticalSpacer(100),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                            color: colors.white,
                          ),
                          child: Column(
                            children: [
                              verticalSpacer(140),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      currentPayableAmount,
                                      style: textStyles.semiBold.copyWith(
                                        fontSize: sizes.fontRatio * 14,
                                        color: colors.primaryColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    BlocBuilder<DashboardBloc, DashboardState>(
                                        builder: (context, state) {
                                      return state.myStudentsResponseModel
                                                  .students !=
                                              null
                                          ? Text(
                                              'AED ${amountFormater(
                                                double.parse(
                                                  state.students[0].student!
                                                      .totalBalanceAmount
                                                      .toString(),
                                                ),
                                              )}',
                                              style:
                                                  textStyles.extraBold.copyWith(
                                                fontSize: sizes.fontRatio * 16,
                                                color: colors.primaryColor,
                                              ),
                                            )
                                          : const SizedBox.shrink();
                                    }),
                                  ],
                                ),
                              ),
                              verticalSpacer(8),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                width: double.infinity,
                                height: 1,
                                color: colors.textGrey.withOpacity(0.5),
                              ),
                              const Spacer(),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: Lottie.asset(
                                  assets.singleStudentJson,
                                  repeat: true,
                                  height: sizes.heightRatio * 250,
                                ),
                              ),
                              verticalSpacer(16),
                              BlocBuilder<DashboardBloc, DashboardState>(
                                builder: (context, state) {
                                  return state.students[0].student!
                                              .totalBalanceAmount ==
                                          0
                                      ? const SizedBox.shrink()
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: horizontalValue(16),
                                          ),
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: colors.white,
                                              elevation: 0,
                                              side: BorderSide(
                                                width: 1,
                                                color: colors.primaryColor,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  14,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: verticalValue(14),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InvoicePaymentPage(
                                                    singleStudentModel:
                                                        getStudentModel(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Center(
                                              child: Text(
                                                continueToPayment,
                                                style: textStyles.bold.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: colors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                },
                              ),
                              verticalSpacer(24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: sizes.heightRatio * 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: colors.lightGrey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                              0,
                              1,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                        vertical: verticalValue(16),
                      ),
                      child: Column(
                        children: [
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return state.students != []
                                  ? Container(
                                      height: sizes.heightRatio * 50,
                                      width: sizes.widthRatio * 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        state.students[0].student?.gender ==
                                                "male"
                                            ? assets.icMale
                                            : assets.icFemale,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          verticalSpacer(8),
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return state.students != []
                                  ? Text(
                                      state.students[0].student?.firstName ??
                                          (state.students[0].student
                                                      ?.lastName !=
                                                  null
                                              ? state
                                                      .parentStudentResponse
                                                      .parentStudent!
                                                      .student!
                                                      .lastName ??
                                                  ''
                                              : ''),
                                      textAlign: TextAlign.center,
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 22,
                                        color: colors.primaryColor,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          verticalSpacer(4),
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return state.students != [] &&
                                      state.students[0].student != null
                                  ? Text(
                                      'Grade ${state.students[0].student!.grade}',
                                      textAlign: TextAlign.center,
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        color: colors.black,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          verticalSpacer(8),
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return state.students != []
                                  ? Text(
                                      state.students[0].student!.school!.name,
                                      textAlign: TextAlign.center,
                                      style: textStyles.bold.copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        color: colors.black,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                          verticalSpacer(4),
                          BlocBuilder<DashboardBloc, DashboardState>(
                            builder: (context, state) {
                              return state.students != []
                                  ? Text(
                                      state
                                          .students[0].student!.school!.address,
                                      textAlign: TextAlign.center,
                                      style: textStyles.regular.copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        color: colors.black,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  single_student_model.SingleStudentModel getStudentModel() {
    return single_student_model.SingleStudentModel(
      id: userController.singleStudentResponse.value.students![0].id,
      parentId:
          userController.singleStudentResponse.value.students![0].parentId,
      studentId:
          userController.singleStudentResponse.value.students![0].studentId,
      deletedAt:
          userController.singleStudentResponse.value.students![0].deletedAt,
      createdAt:
          userController.singleStudentResponse.value.students![0].createdAt,
      updatedAt:
          userController.singleStudentResponse.value.students![0].updatedAt,
      student: single_student_model.Student(
        dob: userController
            .singleStudentResponse.value.students![0].student!.dob,
        admissionDate: userController
            .singleStudentResponse.value.students![0].student!.admissionDate,
        id: userController.singleStudentResponse.value.students![0].student!.id,
        studentRegNo: userController
            .singleStudentResponse.value.students![0].student!.studentRegNo,
        firstName: userController
            .singleStudentResponse.value.students![0].student!.firstName,
        lastName: userController
            .singleStudentResponse.value.students![0].student!.lastName,
        grade: userController
            .singleStudentResponse.value.students![0].student!.grade,
        parentEmiratesId: userController
            .singleStudentResponse.value.students![0].student!.parentEmiratesId,
        parentPhoneNumber: userController.singleStudentResponse.value
            .students![0].student!.parentPhoneNumber,
        deletedAt: userController
            .singleStudentResponse.value.students![0].student!.deletedAt,
        schoolId: userController
            .singleStudentResponse.value.students![0].student!.schoolId,
        totalBalanceAmount: double.parse(userController.singleStudentResponse
            .value.students![0].student!.totalBalanceAmount
            .toString()),
        guardianFirstName: userController.singleStudentResponse.value
            .students![0].student!.guardianFirstName,
        guardianLastName: userController
            .singleStudentResponse.value.students![0].student!.guardianLastName,
        guardianGender: userController
            .singleStudentResponse.value.students![0].student!.guardianGender,
        guardianEmiratesId: userController.singleStudentResponse.value
            .students![0].student!.guardianEmiratesId,
        guardianNationality: userController.singleStudentResponse.value
            .students![0].student!.guardianNationality,
        guardianReligion: userController
            .singleStudentResponse.value.students![0].student!.guardianReligion,
        area: userController
            .singleStudentResponse.value.students![0].student!.area,
        region: userController
            .singleStudentResponse.value.students![0].student!.region,
        streetAddress: userController
            .singleStudentResponse.value.students![0].student!.streetAddress,
        email: userController
            .singleStudentResponse.value.students![0].student!.email,
        phoneNumber: userController
            .singleStudentResponse.value.students![0].student!.phoneNumber,
        otherNumber: userController
            .singleStudentResponse.value.students![0].student!.otherNumber,
        profile: userController
            .singleStudentResponse.value.students![0].student!.profile,
        religion: userController
            .singleStudentResponse.value.students![0].student!.religion,
        nationality: userController
            .singleStudentResponse.value.students![0].student!.nationality,
        gender: userController
            .singleStudentResponse.value.students![0].student!.gender,
        dueDate: userController
            .singleStudentResponse.value.students![0].student!.dueDate,
        file: userController
            .singleStudentResponse.value.students![0].student!.file,
        privacy: userController
            .singleStudentResponse.value.students![0].student!.privacy,
        createdAt: userController
            .singleStudentResponse.value.students![0].student!.createdAt,
        updatedAt: userController
            .singleStudentResponse.value.students![0].student!.updatedAt,
        school: single_student_model.School(
          id: userController
              .singleStudentResponse.value.students![0].student!.school!.id,
          name: userController
              .singleStudentResponse.value.students![0].student!.school!.name,
          deletedAt: userController.singleStudentResponse.value.students![0]
              .student!.school!.deletedAt,
          addedBy: userController.singleStudentResponse.value.students![0]
              .student!.school!.addedBy,
          address: userController.singleStudentResponse.value.students![0]
              .student!.school!.address,
          description: userController.singleStudentResponse.value.students![0]
              .student!.school!.description,
          vat: userController
              .singleStudentResponse.value.students![0].student!.school!.vat,
          paynestFee: userController.singleStudentResponse.value.students![0]
              .student!.school!.paynestFee,
          apiKey: userController
              .singleStudentResponse.value.students![0].student!.school!.apiKey,
          merchantId: userController.singleStudentResponse.value.students![0]
              .student!.school!.merchantId,
          file: userController
              .singleStudentResponse.value.students![0].student!.school!.file,
          privacy: userController.singleStudentResponse.value.students![0]
              .student!.school!.privacy,
          createdAt: userController.singleStudentResponse.value.students![0]
              .student!.school!.createdAt,
          updatedAt: userController.singleStudentResponse.value.students![0]
              .student!.school!.updatedAt,
        ),
      ),
    );
  }
}
