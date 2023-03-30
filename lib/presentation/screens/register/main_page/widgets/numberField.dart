import 'package:paynest_flutter_app/export.dart';

class NumberField extends StatefulWidget {
  const NumberField({
    Key? key,
    required this.enable,
    required this.phoneCodeController,
    required this.textController,
    required this.formKey,
  }) : super(key: key);

  final bool enable;
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
            enabled: !widget.enable,
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
              readOnly: widget.enable,
              keyboardType: TextInputType.phone,
              style: TextStyles().bold.copyWith(
                    fontSize: sizes.fontRatio * 14,
                    color: PayNestTheme.textGrey,
                  ),
              controller: widget.textController,
              decoration: InputDecoration(
                hintText: '987 654 321',
                hintStyle: TextStyles().bold.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      color: AppColors().textGrey,
                    ),
                border: InputBorder.none,
                errorStyle: TextStyles().bold.copyWith(
                      fontSize: sizes.fontRatio * 12,
                      color: AppColors().redShade2,
                    ),
              ),
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value != null && value.trim().isEmpty) {
              //     return phoneFieldCannotBeEmptyValidation;
              //   }
              //   return null;
              // },
            ),
          )
        ],
      ),
    );
  }
}
