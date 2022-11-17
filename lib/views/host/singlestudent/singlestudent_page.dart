import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/extension/stack_extension.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart' as SingleSchoolModel ;
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/invoice_payment_page.dart';
import 'package:paynest_flutter_app/widgets/amount_formater.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../../model/mystudents_resp_model.dart';
import '../../../res/res.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/full_screen_loader.dart';

class SingleStudentPage extends StatefulWidget {
  SingleStudentPage({
    Key? key,
    required this.studentId,
    required this.myStudentsRespModel,
  }) : super(key: key);

  final MyStudentsRespModel myStudentsRespModel;
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
    userController.singleStudentResponse.value = widget.myStudentsRespModel;
    getStudentByStudentId();
  }

  void getStudentByStudentId() async {
    print('${widget.myStudentsRespModel}');
    await userController.getStudentById(
      widget.studentId.toString(),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
          color: Colors.white,
        ),

        child: Stack().fullScreenLoader(
          state: isLoading,
          loadingWidget: fullScreenLoader(),
          child: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: Container(
        height: sizes.height,
        decoration: BoxDecoration(
          color: PayNestTheme.primaryColor,
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
                        iconColor: PayNestTheme.primaryColor,
                        buttonColor: PayNestTheme.colorWhite,
                      ),
                      Text(
                        'Payee Details',
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 18,
                          color: PayNestTheme.colorWhite,
                        ),
                      ),
                      SizedBox(
                        height: 44.h,
                        width: 44.w,
                      )
                    ],
                  ),
                ),
                verticalSpacer(100),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: PayNestTheme.colorWhite,
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
                                'Current Payable Amount',
                                style:
                                    PayNestTheme.h2_12blueAccentLight.copyWith(
                                  fontSize: sizes.fontRatio * 14,
                                  color: PayNestTheme.primaryColor,
                                  fontFamily: 'montserratSemiBold',
                                ),
                              ),
                              Spacer(),
                              userController.singleStudentResponse.value
                                          .students !=
                                      null
                                  ? Text(
                                      'AED ${amountFormater(
                                        double.parse(
                                          userController
                                              .singleStudentResponse
                                              .value
                                              .students![0]
                                              .student!
                                              .totalBalanceAmount
                                              .toString(),
                                        ),
                                      )}',
                                      style:
                                          PayNestTheme.h2_12blueAccent.copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        fontFamily: 'montserratExtraBold',
                                        color: PayNestTheme.primaryColor,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
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
                          color: PayNestTheme.textGrey.withOpacity(0.5),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Lottie.asset(
                            singleStudentJson,
                            repeat: true,
                            height: sizes.heightRatio * 250,
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: PayNestTheme.colorWhite,
                              elevation: 0,
                              side: BorderSide(
                                width: 1,
                                color: PayNestTheme.primaryColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
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
                                  builder: (context) => InvoicePaymentPage(
                                    singleStudentModel:
                                        getStudentModel(),
                                  ),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                continueToPayment,
                                style: PayNestTheme.title_2_16primaryColor
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: sizes.fontRatio * 14,
                                  color: PayNestTheme.primaryColor,
                                  fontFamily: 'montserratBold',
                                ),
                              ),
                            ),
                          ),
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
                  color: PayNestTheme.colorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
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
                    userController.singleStudentResponse.value.students != null
                        ? Container(
                            height: sizes.heightRatio * 50,
                            width: sizes.widthRatio * 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              userController.singleStudentResponse.value
                                          .students![0].student?.gender ==
                                      "male"
                                  ? icMale
                                  : icFemale,
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(8),
                    userController.singleStudentResponse.value.students != null
                        ? Text(
                            '${userController.singleStudentResponse.value.students![0].student?.firstName ?? '' + (userController.singleStudentResponse.value.students![0].student?.lastName != null ? userController.parentStudentResponse.parentStudent!.student!.lastName ?? '' : '')}',
                            textAlign: TextAlign.center,
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 22,
                              color: PayNestTheme.primaryColor,
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(4),
                    userController.singleStudentResponse.value.students !=
                                null &&
                            userController.singleStudentResponse.value
                                    .students![0].student !=
                                null
                        ? Text(
                            'Grade ${userController.singleStudentResponse.value.students![0].student!.grade}',
                            textAlign: TextAlign.center,
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(8),
                    userController.singleStudentResponse.value.students != null
                        ? Text(
                            '${userController.singleStudentResponse.value.students![0].student!.school!.name}',
                            textAlign: TextAlign.center,
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(4),
                    userController.singleStudentResponse.value.students != null
                        ? Text(
                            '${userController.singleStudentResponse.value.students![0].student!.school!.address}',
                            textAlign: TextAlign.center,
                            style: PayNestTheme.small_2_10textGrey.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleSchoolModel.SingleStudentModel getStudentModel() {
    return SingleSchoolModel.SingleStudentModel(
      id: userController.singleStudentResponse.value.students![0].id,
      parentId: userController.singleStudentResponse.value.students![0].parentId,
      studentId: userController.singleStudentResponse.value.students![0].studentId,
      deletedAt: userController.singleStudentResponse.value.students![0].deletedAt,
      createdAt: userController.singleStudentResponse.value.students![0].createdAt,
      updatedAt: userController.singleStudentResponse.value.students![0].updatedAt,
      student: SingleSchoolModel.Student(
        dob: userController.singleStudentResponse.value.students![0].student!.dob,
        admissionDate: userController.singleStudentResponse.value.students![0].student!.admissionDate,
        id: userController.singleStudentResponse.value.students![0].student!.id,
        studentRegNo: userController.singleStudentResponse.value.students![0].student!.studentRegNo,
        firstName: userController.singleStudentResponse.value.students![0].student!.firstName,
        lastName: userController.singleStudentResponse.value.students![0].student!.lastName,
        grade: userController.singleStudentResponse.value.students![0].student!.grade,
        parentEmiratesId: userController.singleStudentResponse.value.students![0].student!.parentEmiratesId,
        parentPhoneNumber: userController.singleStudentResponse.value.students![0].student!.parentPhoneNumber,
        deletedAt: userController.singleStudentResponse.value.students![0].student!.deletedAt,
        schoolId: userController.singleStudentResponse.value.students![0].student!.schoolId,
        totalBalanceAmount:
        double.parse(userController.singleStudentResponse.value.students![0].student!.totalBalanceAmount.toString()),
        guardianFirstName: userController.singleStudentResponse.value.students![0].student!.guardianFirstName,
        guardianLastName: userController.singleStudentResponse.value.students![0].student!.guardianLastName,
        guardianGender: userController.singleStudentResponse.value.students![0].student!.guardianGender,
        guardianEmiratesId: userController.singleStudentResponse.value.students![0].student!.guardianEmiratesId,
        guardianNationality: userController.singleStudentResponse.value.students![0].student!.guardianNationality,
        guardianReligion: userController.singleStudentResponse.value.students![0].student!.guardianReligion,
        area: userController.singleStudentResponse.value.students![0].student!.area,
        region: userController.singleStudentResponse.value.students![0].student!.region,
        streetAddress: userController.singleStudentResponse.value.students![0].student!.streetAddress,
        email: userController.singleStudentResponse.value.students![0].student!.email,
        phoneNumber: userController.singleStudentResponse.value.students![0].student!.phoneNumber,
        otherNumber: userController.singleStudentResponse.value.students![0].student!.otherNumber,
        profile: userController.singleStudentResponse.value.students![0].student!.profile,
        religion: userController.singleStudentResponse.value.students![0].student!.religion,
        nationality: userController.singleStudentResponse.value.students![0].student!.nationality,
        gender: userController.singleStudentResponse.value.students![0].student!.gender,
        dueDate: userController.singleStudentResponse.value.students![0].student!.dueDate,
        file: userController.singleStudentResponse.value.students![0].student!.file,
        privacy: userController.singleStudentResponse.value.students![0].student!.privacy,
        createdAt: userController.singleStudentResponse.value.students![0].student!.createdAt,
        updatedAt: userController.singleStudentResponse.value.students![0].student!.updatedAt,
        school: SingleSchoolModel.School(
          id: userController.singleStudentResponse.value.students![0].student!.school!.id,
          name: userController.singleStudentResponse.value.students![0].student!.school!.name,
          deletedAt: userController.singleStudentResponse.value.students![0].student!.school!.deletedAt,
          addedBy: userController.singleStudentResponse.value.students![0].student!.school!.addedBy,
          address: userController.singleStudentResponse.value.students![0].student!.school!.address,
          description: userController.singleStudentResponse.value.students![0].student!.school!.description,
          vat: userController.singleStudentResponse.value.students![0].student!.school!.vat,
          paynestFee: userController.singleStudentResponse.value.students![0].student!.school!.paynestFee,
          apiKey: userController.singleStudentResponse.value.students![0].student!.school!.apiKey,
          merchantId: userController.singleStudentResponse.value.students![0].student!.school!.merchantId,
          file: userController.singleStudentResponse.value.students![0].student!.school!.file,
          privacy: userController.singleStudentResponse.value.students![0].student!.school!.privacy,
          createdAt: userController.singleStudentResponse.value.students![0].student!.school!.createdAt,
          updatedAt: userController.singleStudentResponse.value.students![0].student!.school!.updatedAt,
        ),
      ),
    );
  }
}
