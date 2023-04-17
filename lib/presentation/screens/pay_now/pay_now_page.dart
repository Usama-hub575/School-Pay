import 'package:paynest_flutter_app/export.dart';

class PayNowPage extends StatefulWidget {
  final String whichStack;

  const PayNowPage({
    super.key,
    required this.whichStack,
  });

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  // final MyStudentController studentController = Get.find<MyStudentController>();

  // final PayNowController payNowController = Get.put(PayNowController());
  // final CreateTransactionRespController ctrController =
  //     Get.put(CreateTransactionRespController());

  // late StudentElement studentElement;
  //
  // int idx = 0;
  TextEditingController amountController = TextEditingController();
  TextEditingController parentIDController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController schoolIDController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  // String payAbleAmount = '0';
  // bool isLoading = false;
  //
  // var appToken = "";
  // var customerId = "";
  // var reconnectId = "";
  // var paymentDestinationId = "";
  // var paymentIntentId = "";
  // List<Permission> permissions = [
  //   Permission.identity,
  //   Permission.transactions,
  //   Permission.balance,
  //   Permission.accounts
  // ];
  int tap = 0;
  var isSandbox = true;

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(
          ResetSelectedCard(),
        );
    if (context.read<DashboardBloc>().state.myStudentsResponseModel.status &&
        context.read<DashboardBloc>().state.myStudentsResponseModel.students !=
            null &&
        context
            .read<DashboardBloc>()
            .state
            .myStudentsResponseModel
            .students!
            .isNotEmpty) {
      amountController.text = context
          .read<DashboardBloc>()
          .state
          .myStudentsResponseModel
          .students![0]
          .student!
          .totalBalanceAmount
          .toString();
      studentIDController.text = context
          .read<DashboardBloc>()
          .state
          .myStudentsResponseModel
          .students![0]
          .studentId
          .toString();
      parentIDController.text = context
          .read<DashboardBloc>()
          .state
          .myStudentsResponseModel
          .students![0]
          .parentId
          .toString();
      schoolIDController.text = context
          .read<DashboardBloc>()
          .state
          .myStudentsResponseModel
          .students![0]
          .student!
          .schoolId
          .toString();
    }
    // isLoading = false;
    // initPlatformState();
    // MerchantConstants.setDetails(
    //   mId: '202212070001',
    //   mKey: 'ozJKEN0EBRtHbLJBEO/3/FG29iKM50WJ/6STY6zH5HU=',
    //   aggId: 'Paygate',
    //   environment: Environment.TEST,
    // );
  }

  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   try {
  //     platformVersion =
  //         await Safexpay.platformVersion ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;
  //
  //   setState(() {});
  // }

  // onSearchTextChanged(String text) async {
  //   searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //
  //   studentController.myStudentData.value.students!.forEach((studentElement) {
  //     if (studentElement.student!.firstName
  //             .toUpperCase()
  //             .contains(text.toUpperCase()) ||
  //         studentElement.student!.lastName
  //             .toUpperCase()
  //             .contains(text.toUpperCase())) {
  //       _searchResult.add(studentElement);
  //     }
  //   });
  //
  //   setState(() {});
  // }

  // _connect() {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     backgroundColor: Colors.red,
  //     context: context,
  //     builder: (context) {
  //       return SizedBox(
  //         height: MediaQuery.of(context).size.height * 0.8,
  //         child: Lean.connect(
  //           appToken: appToken,
  //           customerId: customerId,
  //           permissions: permissions,
  //           isSandbox: isSandbox,
  //           callback: (resp) async {
  //             var results = jsonDecode(resp);
  //             if (results['status'] == 'SUCCESS') {
  //               var data = {
  //                 "schoolId": int.parse(
  //                   schoolIDController.text,
  //                 ),
  //                 "amount": amountController.text,
  //                 "studentId": studentIDController.text,
  //               };
  //               var createPaymentIntent =
  //                   await APIService().createPaymentIntent(
  //                 jsonEncode(data),
  //               );
  //               var leanPaymentDecoded = jsonDecode(createPaymentIntent);
  //               CreatePaymentIntentModel createPaymentIntentModel =
  //                   CreatePaymentIntentModel.fromJson(leanPaymentDecoded);
  //               if (createPaymentIntentModel.status!) {
  //                 appToken =
  //                     createPaymentIntentModel.data!.leanAppToken.toString();
  //                 paymentIntentId =
  //                     createPaymentIntentModel.data!.paymentIntentId.toString();
  //                 await _pay(
  //                   model: createPaymentIntentModel,
  //                 );
  //               }
  //             }
  //             Navigator.pop(context);
  //           },
  //           actionCancelled: () => Navigator.pop(context),
  //         ),
  //       );
  //     },
  //   );
  // }

  // List<StudentData> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayNowBloc, PayNowState>(
      builder: (context, state) {
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
              state: state.isLoading,
              loadingWidget: fullScreenLoader(),
              child: getBody(),
            ),
          ),
        );
      },
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      body: Column(
        children: [
          Container(
            height: verticalValue(129),
            width: MediaQuery.of(context).size.width,
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
                padding: EdgeInsets.only(left: verticalValue(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        widget.whichStack == "other"
                            ? AppBarBackButton(
                                buttonColor: colors.white,
                                iconColor: colors.primaryColor,
                              )
                            : const SizedBox(),
                        horizontalSpacer(122),
                        Text(
                          pay,
                          style: textStyles.bold.copyWith(
                            color: colors.white,
                            fontSize: sizes.fontRatio * 18,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(
                        26,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(20),
                      vertical: verticalValue(10),
                    ),
                    child: state.myStudentsResponseModel.status
                        ? state.myStudentsResponseModel.students != null &&
                                state.myStudentsResponseModel.students!
                                    .isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpacer(16),
                                  Text(
                                    selectStudent,
                                    style: textStyles.extraBold.copyWith(
                                      color: colors.primaryColor,
                                      fontSize: sizes.fontRatio * 16,
                                    ),
                                  ),
                                  verticalSpacer(13),
                                  SearchTextField(
                                    controller: searchController,
                                    onChanged: (value) {
                                      context.read<DashboardBloc>().add(
                                            PayNowOnSearchChange(
                                              value: value,
                                            ),
                                          );
                                    },
                                  ),
                                  BlocBuilder<PayNowBloc, PayNowState>(
                                    builder: (context, payNowState) {
                                      return BlocBuilder<DashboardBloc,
                                          DashboardState>(
                                        builder: (context, dashboardState) {
                                          return dashboardState
                                                  .searchResult.isEmpty
                                              ? const Expanded(
                                                  child: NoDataText(),
                                                )
                                              : Expanded(
                                                  child: ListView(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    children: [
                                                      dashboardState
                                                              .searchResult
                                                              .isNotEmpty
                                                          ? SizedBox(
                                                              height: sizes
                                                                      .heightRatio *
                                                                  156,
                                                              child: ListView
                                                                  .separated(
                                                                itemCount:
                                                                    dashboardState
                                                                        .searchResult
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return StudentSingleCard(
                                                                    index:
                                                                        index,
                                                                    studentData:
                                                                        dashboardState
                                                                            .searchResult[index],
                                                                    onTap: (StudentData
                                                                        student) {
                                                                      context
                                                                          .read<
                                                                              PayNowBloc>()
                                                                          .add(
                                                                            StudentCardOnTap(
                                                                              payAbleAmount: student.student!.totalBalanceAmount.toString(),
                                                                              studentData: student,
                                                                            ),
                                                                          );
                                                                      context
                                                                          .read<
                                                                              DashboardBloc>()
                                                                          .add(
                                                                            UpdatedSelectedCard(
                                                                              id: student.id,
                                                                            ),
                                                                          );
                                                                      amountController.text = student
                                                                          .student!
                                                                          .totalBalanceAmount
                                                                          .toString();
                                                                    },
                                                                  );
                                                                },
                                                                separatorBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return horizontalSpacer(
                                                                      16);
                                                                },
                                                              ),
                                                            )
                                                          : const NoDataText(),
                                                      verticalSpacer(30),
                                                      PayAbleAmountUI(
                                                        amount: amountController
                                                            .text,
                                                      ),
                                                      verticalSpacer(16),
                                                    ],
                                                  ),
                                                );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              )
                            : NoDataFound(
                                showElevatedButton: false,
                                showIconButton: false,
                                showLogo: false,
                              )
                        : NoDataFound(
                            showElevatedButton: false,
                            showIconButton: false,
                            showLogo: false,
                          ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Future onSafexPayClick(BuildContext context) async {
  //   MHSafeXPayGateway safeXPayGateway = MHSafeXPayGateway(
  //     orderNo: '${Random().nextInt(1000)}',
  //     amount: double.parse(
  //       payAbleAmount,
  //     ),
  //     currency: 'AED',
  //     transactionType: 'SALE',
  //     channel: 'MOBILE',
  //     successUrl: 'http://localhost/safexpay/response.php',
  //     failureUrl: 'http://localhost/safexpay/response.php',
  //     countryCode: 'ARE',
  //     pgDetails: '|||',
  //     customerDetails: '||||',
  //     cardDetails: '||||',
  //     billDetails: '||||',
  //     shipDetails: '||||||',
  //     itemDetails: '||',
  //     upiDetails: '',
  //     otherDetails: '||||',
  //   );
  //   final result = await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => safeXPayGateway,
  //     ),
  //   );
  //
  //   if (result != null) {
  //     showToast(
  //         message: result?.strStatus ?? "No data found!",
  //         context: context,
  //         color: result.strStatus == "Successful"
  //             ? colors.primaryColor
  //             : Colors.red);
  //   }
  // }

  // Future onLeanPaymentTap() async {
  //   var res = await APIService().leanPayment();
  //   var decoded = jsonDecode(res);
  //   LeanPaymentModel leanPaymentModel = LeanPaymentModel.fromJson(decoded);
  //   appToken = leanPaymentModel.response!.leanAppToken.toString();
  //   customerId = leanPaymentModel.response!.leanCustomerId.toString();
  //   if (!leanPaymentModel.status!) {
  //     _connect();
  //   } else {
  //     var data = {
  //       "schoolId": int.parse(
  //         schoolIDController.text,
  //       ),
  //       "amount": amountController.text,
  //       "studentId": studentIDController.text,
  //     };
  //     var createPaymentIntent = await APIService().createPaymentIntent(
  //       jsonEncode(data),
  //     );
  //     var leanPaymentDecoded = jsonDecode(createPaymentIntent);
  //     CreatePaymentIntentModel createPaymentIntentModel =
  //         CreatePaymentIntentModel.fromJson(leanPaymentDecoded);
  //     if (createPaymentIntentModel.status!) {
  //       appToken = createPaymentIntentModel.data!.leanAppToken.toString();
  //       paymentIntentId =
  //           createPaymentIntentModel.data!.paymentIntentId.toString();
  //       await _pay(
  //         model: createPaymentIntentModel,
  //       );
  //     }
  //   }
  // }

  Future<void> _pay({
    required CreatePaymentIntentModel model,
  }) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Lean.pay(
            appToken: model.data!.leanAppToken!,
            paymentIntentId: model.data!.paymentIntentId!,
            country: Country.uae,
            isSandbox: isSandbox,
            callback: (resp) {
              jsonDecode(resp.toString());
              LeanServerResponse leanResponse = LeanServerResponse.fromJson(
                jsonDecode(resp.toString()),
              );
              showToast(
                message: leanResponse.message ?? '',
                context: context,
                color: leanResponse.status == 'SUCCESS'
                    ? Colors.green
                    : Colors.redAccent,
              );
              Navigator.pop(context);
              if (leanResponse.status == 'SUCCESS') {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/DashboardPage',
                  (Route<dynamic> route) => false,
                );
              }
            },
            actionCancelled: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  // void onPress() async {
  //   if (studentController.myStudentData.value.status) {
  //     if (int.parse(amountController.text) > 0) {
  //       int orderId = Random().nextInt(
  //         1000000000,
  //       );
  //       // isLoading = true;
  //       if (mounted) {
  //         setState(() {});
  //       }
  //       final response = await ctrController.hitCreateTransaction(
  //         schoolIDController.text,
  //         parentIDController.text,
  //         studentIDController.text,
  //         amountController.text,
  //         orderId.toString(),
  //       );
  //       if (response) {
  //         final result = await Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (BuildContext context) => MyWebView(
  //               title: "CBD",
  //               amount: amountController.text,
  //               indx: 0,
  //               orderId: orderId,
  //               schoolId: int.parse(
  //                 schoolIDController.text,
  //               ),
  //             ),
  //           ),
  //         );
  //         if (result != null && result) {
  //           studentController.myStudentData.update(
  //             (val) {
  //               String? schoolName;
  //               for (int i = 0; i < val!.students!.length; i++) {
  //                 // if (val.students![i].student!.totalBalanceAmount ==
  //                 //     payAbleAmount) {
  //                 //   schoolName = val.students![i].student!.school?.name ?? '';
  //                 //   break;
  //                 // }
  //               }
  //               PayNowTransactionDetailModel model;
  //               // model = _getModel(
  //               //   state.studentData,
  //               //   schoolName,
  //               //   amountController.text,
  //               // );
  //               // isLoading = false;
  //               setState(() {});
  //               Future.delayed(
  //                 const Duration(
  //                   seconds: 1,
  //                 ),
  //                 () {
  //                   // Navigator.of(context).push(
  //                   //   MaterialPageRoute(
  //                   //     builder: (context) => PayNowTransactionDetailsPage(
  //                   //       payNowTransactionDetailModel: model,
  //                   //     ),
  //                   //   ),
  //                   // );
  //                 },
  //               );
  //             },
  //           );
  //         } else {
  //           if (mounted) {
  //             // isLoading = false;
  //             setState(() {});
  //             Future.delayed(
  //               Duration.zero,
  //               () {
  //                 showToast(
  //                   context: context,
  //                   message: somethingWentWrongWithTheTransaction,
  //                   color: colors.red,
  //                 );
  //               },
  //             );
  //           }
  //         }
  //       } else {
  //         if (mounted) {
  //           // isLoading = false;
  //           setState(() {});
  //           Future.delayed(
  //             Duration.zero,
  //             () {
  //               showToast(
  //                 context: context,
  //                 message: somethingWentWrongWithTheTransaction,
  //                 color: colors.red,
  //               );
  //             },
  //           );
  //         }
  //       }
  //     } else if (int.parse(amountController.text) < 0) {
  //       // isLoading = false;
  //       setState(() {});
  //       Future.delayed(
  //         Duration.zero,
  //         () {
  //           showToast(
  //             context: context,
  //             message: amountIsNotCorrect,
  //             color: colors.red,
  //           );
  //         },
  //       );
  //     } else if (int.parse(amountController.text) == 0) {
  //       // isLoading = false;
  //       setState(() {});
  //       Future.delayed(
  //         Duration.zero,
  //         () {
  //           showToast(
  //             context: context,
  //             message: feesAlreadyPaid,
  //             color: colors.green2,
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     if (mounted) {
  //       // isLoading = false;
  //       setState(() {});
  //       Future.delayed(
  //         Duration.zero,
  //         () {
  //           showToast(
  //             context: context,
  //             message: somethingWentWrongWithTheTransaction,
  //             color: colors.red,
  //           );
  //         },
  //       );
  //     }
  //   }
  // }

  // Widget commercialImage({required String imagePath}) {
  //   return Container(
  //     height: sizes.heightRatio * 41,
  //     width: sizes.widthRatio * 41,
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: AssetImage(imagePath),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //   );
  // }

  // Widget _otherImage({required String imagePath, required double opacity}) {
  //   return Opacity(
  //     opacity: opacity,
  //     child: Container(
  //       height: sizes.heightRatio * 26,
  //       width: sizes.widthRatio * 70,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: AssetImage(imagePath),
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Future<String> encrypt(amount) async {
  //   final key = encryption.Key.fromUtf8("90UJEG5OQZYD1OAB");
  //   final iv = encryption.IV.fromUtf8("90UJEG5OQZYD1OAB");
  //   final encrypter =
  //       encryption.Encrypter(encryption.AES(key, mode: encryption.AESMode.cbc));
  //   final encrypted = encrypter.encrypt(amount, iv: iv);
  //   print(encrypted.base64);
  //   return encrypted.base64;
  // }

  // _singleCard(StudentData studentElement, Function onTap, int index) {
  //   return InkWellWidget(
  //     onTap: () => onTap(studentElement),
  //     child: Opacity(
  //       opacity: studentElement.isSelected ? 1 : 0.5,
  //       child: Stack(
  //         children: [
  //           Container(
  //             margin: EdgeInsets.symmetric(
  //               vertical: verticalValue(8),
  //             ),
  //             padding: EdgeInsets.symmetric(
  //               horizontal: horizontalValue(12),
  //               vertical: verticalValue(16),
  //             ),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24),
  //               color: colors.primaryColor.withOpacity(0.5),
  //             ),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   height: sizes.heightRatio * 50,
  //                   width: sizes.widthRatio * 50,
  //                   decoration: const BoxDecoration(
  //                     shape: BoxShape.circle,
  //                   ),
  //                   child: SvgPicture.asset(
  //                     studentElement.student?.gender == "male"
  //                         ? assets.icMale
  //                         : assets.icFemale,
  //                   ),
  //                 ),
  //                 verticalSpacer(8),
  //                 SizedBox(
  //                   width: sizes.widthRatio * 60,
  //                   child: Text(
  //                     '${studentElement.student?.firstName} \n  ${(studentElement.student?.lastName != '-' ? studentElement.student?.lastName : '')}',
  //                     textAlign: TextAlign.center,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: textStyles.bold.copyWith(
  //                       fontSize: sizes.fontRatio * 13,
  //                       color: index % 2 == 0 ? colors.white : colors.black,
  //                     ),
  //                   ),
  //                 ),
  //                 const Spacer(),
  //                 SizedBox(
  //                   width: sizes.widthRatio * 80,
  //                   child: Text(
  //                     '${studentElement.student?.school!.name}',
  //                     maxLines: 2,
  //                     textAlign: TextAlign.center,
  //                     style: textStyles.regular.copyWith(
  //                       fontSize: sizes.fontRatio * 10,
  //                       color: index % 2 == 0 ? colors.white : colors.black,
  //                       fontWeight: FontWeight.w300,
  //                     ),
  //                   ),
  //                 ),
  //                 const Spacer()
  //               ],
  //             ),
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             left: 0,
  //             right: 0,
  //             child: SvgPicture.asset(
  //               assets.icAdd,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  PayNowTransactionDetailModel _getModel(
    StudentData studentData,
    String? schoolName,
    String amount,
  ) {
    return PayNowTransactionDetailModel(
      schoolName: schoolName,
      student: PayNowTransactionDetailStudent(
        id: studentData.id,
        studentRegNo: studentData.student!.studentRegNo,
        firstName: studentData.student!.firstName,
        lastName: studentData.student!.lastName,
        grade: studentData.student!.grade,
        parentEmiratesId: studentData.student!.parentEmiratesId,
        parentPhoneNumber: studentData.student!.parentPhoneNumber,
        dob: studentData.student!.dob,
        admissionDate: studentData.student!.admissionDate,
        deletedAt: studentData.student!.deletedAt,
        schoolId: studentData.student!.schoolId,
        totalBalanceAmount: studentData.student!.totalBalanceAmount.toString(),
        guardianFirstName: studentData.student!.guardianFirstName!,
        guardianLastName: studentData.student!.guardianLastName!,
        guardianGender: studentData.student!.guardianGender!,
        guardianEmiratesId: studentData.student!.guardianEmiratesId!,
        guardianNationality: studentData.student!.guardianNationality!,
        guardianReligion: studentData.student!.guardianReligion!,
        area: studentData.student!.area!,
        region: studentData.student!.region!,
        streetAddress: studentData.student!.streetAddress!,
        email: studentData.student!.email!,
        phoneNumber: studentData.student!.phoneNumber!,
        otherNumber: studentData.student!.otherNumber!,
        profile: studentData.student!.profile,
        religion: studentData.student!.religion!,
        nationality: studentData.student!.nationality!,
        gender: studentData.student!.gender!,
        dueDate: studentData.student!.dueDate!,
        file: studentData.student!.file,
        privacy: studentData.student!.privacy!,
        createdAt: studentData.student!.createdAt!,
        updatedAt: studentData.student!.updatedAt!,
      ),
      referenceNo: '',
      paidOn: DateTime.now(),
      amountPaid: amount,
    );
  }
}
