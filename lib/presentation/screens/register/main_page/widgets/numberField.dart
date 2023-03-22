import 'package:paynest_flutter_app/export.dart';

class NumberField extends StatefulWidget {
  const NumberField({
    Key? key,
    required this.phoneCodeController,
    required this.textController,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController phoneCodeController;
  final TextEditingController textController;
  final GlobalKey<FormState> formKey;

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors().textGrey.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            borderColor: AppColors().lightBlack,
            padding: EdgeInsets.zero,
            showDropDownButton: true,
            onChanged: (value) {
              setState(() {
                widget.phoneCodeController.text = value.toString();
              });
            },
            initialSelection: widget.phoneCodeController.text,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            flagDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            flagWidth: sizes.fontRatio * 50,
            textStyle: TextStyles().bold.copyWith(
                  color: AppColors().black,
                  fontSize: sizes.fontRatio * 16,
                ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyles().bold.copyWith(
                    fontSize: sizes.fontRatio * 14,
                    color: PayNestTheme.textGrey,
                  ),
              controller: widget.textController,
              decoration: InputDecoration(
                hintText: '987 654 321',
                hintStyle: TextStyle(
                  fontSize: sizes.fontRatio * 14,
                  color: AppColors().textGrey,
                  fontFamily: 'montserratBold',
                ),
                border: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.trim().isEmpty) {
                  return 'Phone Field Cannot Be Empty';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}

// Widget numberField({
//   required TextEditingController phoneCodeController,
//   required TextEditingController textController,
//   required GlobalKey<FormState> formKey,
// }) {
//   return Container(
//     padding: EdgeInsets.zero,
//     decoration: BoxDecoration(
//       border: Border(
//         bottom: BorderSide(
//           color: AppColors().textGrey.withOpacity(0.5),
//         ),
//       ),
//     ),
//     child: Row(
//       children: [
//         CountryCodePicker(
//           borderColor: AppColors().lightBlack,
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
//           textStyle: TextStyles().bold.copyWith(
//             color: AppColors().black,
//             fontSize: sizes.fontRatio * 16,
//           ),
//         ),
//         Expanded(
//           child: TextFormField(
//             keyboardType: TextInputType.phone,
//             style: TextStyles().bold.copyWith(
//               fontSize: sizes.fontRatio * 14,
//               color: PayNestTheme.textGrey,
//             ),
//             controller: textController,
//             decoration: InputDecoration(
//               hintText: '987 654 321',
//               hintStyle: TextStyle(
//                 fontSize: sizes.fontRatio * 14,
//                 color: AppColors().textGrey,
//                 fontFamily: 'montserratBold',
//               ),
//               border: InputBorder.none,
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value != null && value
//                   .trim()
//                   .isEmpty) {
//                 return 'phone not be empty';
//               }
//               return null;
//             },
//           ),
//         )
//       ],
//     ),
//   );
// }
