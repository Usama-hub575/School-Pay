// import 'package:flutter/material.dart';
// import 'package:paynest_schoolpay/presentation/assets/colors.gen.dart';
// import 'package:paynest_schoolpay/presentation/res/res.dart';
// import 'package:paynest_schoolpay/presentation/res/text_styles.dart';
//
// import 'custom_phone_number_field/country_code_picker.dart';
//
// Widget numberField() {
//   return Container(
//     padding: EdgeInsets.zero,
//     decoration: BoxDecoration(
//       border: Border(
//         bottom: BorderSide(
//           color: ColorName.textGrey.withOpacity(0.5),
//         ),
//       ),
//     ),
//     child: Row(
//       children: [
//         CountryCodePicker(
//           borderColor: ColorName.lightBlack,
//           padding: EdgeInsets.zero,
//           showDropDownButton: true,
//           onChanged: (value) {
//             setState(() {
//               phoneCodeController.text = value.toString();
//             });
//           },
//           initialSelection: phoneCodeController.text,
//           showCountryOnly: false,
//           showOnlyCountryWhenClosed: false,
//           alignLeft: false,
//           flagDecoration: const BoxDecoration(
//             shape: BoxShape.circle,
//           ),
//           flagWidth: sizes.fontRatio * 50,
//           textStyle: TextStyles.bold.copyWith(
//             fontSize: sizes.fontRatio * 16,
//             color: ColorName.black,
//           ),
//         ),
//         Expanded(
//           child: TextFormField(
//             keyboardType: TextInputType.phone,
//             style: TextStyles.bold.copyWith(
//               color: ColorName.textGrey,
//               fontSize: sizes.fontRatio * 14,
//             ),
//             controller: phoneController,
//             decoration: InputDecoration(
//               hintText: '987 654 321',
//               hintStyle: TextStyles.bold.copyWith(
//                 fontSize: sizes.fontRatio * 14,
//                 color: ColorName.textGrey,
//               ),
//               border: InputBorder.none,
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               return null;
//             },
//           ),
//         )
//       ],
//     ),
//   );
// }
