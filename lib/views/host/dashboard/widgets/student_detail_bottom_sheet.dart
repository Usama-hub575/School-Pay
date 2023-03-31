// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:paynest_flutter_app/theme/theme.dart';
// import 'package:paynest_flutter_app/views/host/dashboard/widgets/succes_bottom_sheet.dart';
//
// import '../../../../constants/constants.dart';
// import '../../../../controller/addstudent_controller.dart';
// import '../../../../controller/user_controller.dart';
// import '../../../../presentation/res/res.dart';
// import '../../../../widgets/spacer.dart';
// import '../../../../widgets/toast.dart';
//
// class StudentDetailBottomSheet {
//   static void show({
//     required BuildContext context,
//   }) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       isDismissible: true,
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return StudentWidget();
//       },
//     );
//   }
// }
//
// class StudentWidget extends StatefulWidget {
//   StudentWidget();
//
//   @override
//   State<StudentWidget> createState() => _StudentWidgetState();
// }
//
// class _StudentWidgetState extends State<StudentWidget> {
//   final TextEditingController _studentCode = TextEditingController();
//   final UserController userController = Get.find<UserController>();
//   AddStudentController addStudentController = Get.put(AddStudentController());
//
//   @override
//   void initState() {
//     super.initState();
//     _studentCode.text = '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: PayNestTheme.black.withOpacity(0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           IntrinsicHeight(
//             child: Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(
//                 horizontal: horizontalValue(16),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16.0),
//                   topRight: Radius.circular(16.0),
//                 ),
//                 color: PayNestTheme.colorWhite,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: horizontalValue(30),
//                 ),
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       verticalSpacer(48),
//                       Text(
//                         enterStudentDetail,
//                         style: PayNestTheme.title_2_16primaryColor.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: PayNestTheme.primaryColor,
//                           fontFamily: 'montserratBold',
//                           fontSize: sizes.fontRatio * 16,
//                         ),
//                       ),
//                       verticalSpacer(16),
//                       Container(
//                         height: sizes.heightRatio * 60,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           bottom: MediaQuery.of(context).viewInsets.bottom,
//                         ),
//                         child: TextFormField(
//                           controller: _studentCode,
//                           inputFormatters: <TextInputFormatter>[
//                             FilteringTextInputFormatter.allow(
//                               RegExp("[0-9a-zA-Z,-]"),
//                             ),
//                           ], // Only num,
//                           style: PayNestTheme.title_3_16blackbold.copyWith(
//                             fontSize: sizes.fontRatio * 12,
//                             color: PayNestTheme.lightBlack,
//                             fontFamily: 'montserratSemiBold',
//                           ),
//                           decoration: InputDecoration(
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: PayNestTheme.textGrey.withOpacity(
//                                   0.5,
//                                 ),
//                               ),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: PayNestTheme.textGrey.withOpacity(0.5),
//                               ),
//                             ),
//                             labelText: enterPaynestStudentCode,
//                             labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
//                               fontSize: sizes.fontRatio * 12,
//                               color: PayNestTheme.primaryColor,
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: PayNestTheme.textGrey.withOpacity(0.5),
//                               ),
//                             ),
//                             errorBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: PayNestTheme.textGrey.withOpacity(0.5),
//                               ),
//                             ),
//                             disabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: PayNestTheme.textGrey.withOpacity(0.5),
//                               ),
//                             ),
//                           ),
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                         ),
//                       ),
//                       verticalSpacer(22.0),
//                       Obx(
//                         () => Container(
//                           width: double.infinity,
//                           height: sizes.heightRatio * 50,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: PayNestTheme.primaryColor,
//                               elevation: 0,
//                               // side: BorderSide(width:1, color:Colors.white),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                   14,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () async {
//                               final model = {
//                                 "paynestNumber": _studentCode.text,
//                               };
//                               await addStudentController
//                                   .addStudentWithPaynestNumber(model);
//                               if (addStudentController.isStudentAdded == true) {
//                                 Navigator.of(context).pop();
//                                 addStudentController.isStudentAdded == true
//                                     ? SuccessBottomSheet.show(
//                                         context: context,
//                                       )
//                                     : addStudentController.isLoading.value =
//                                         false;
//                               } else {
//                                 addStudentController.isLoading.value = false;
//                                 Navigator.of(context).pop();
//                                 showToast(
//                                     context: context,
//                                     message: addStudentController.errorMessage
//                                         .toString(),
//                                     color: PayNestTheme.red);
//                               }
//                             },
//                             child: Center(
//                               child: !addStudentController.isLoading.value
//                                   ? Text(
//                                       next,
//                                       style: PayNestTheme.title_2_16primaryColor
//                                           .copyWith(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 14,
//                                         color: PayNestTheme.colorWhite,
//                                       ),
//                                     )
//                                   : CircularProgressIndicator(
//                                       backgroundColor: PayNestTheme.colorWhite,
//                                       color: PayNestTheme.blueAccent,
//                                     ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       verticalSpacer(22.0),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
