import 'package:paynest_flutter_app/export.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    Key? key,
    required this.readOnly,
    required this.onValidate,
    required this.controller,
    required this.labelText,
    this.validatorText,
    required this.obscureText,
    this.inputFormatters,
    this.icon,
  }) : super(key: key);

  final bool readOnly;
  final Function(String value) onValidate;
  final TextEditingController controller;
  final String labelText;
  final String? validatorText;
  final bool obscureText;
  final Widget? icon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      textInputAction: TextInputAction.done,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(
        fontSize: sizes.fontRatio * 16,
      ),
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().textGrey.withOpacity(
                  0.5,
                ),
          ),
        ),
        suffixIcon: widget.icon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().textGrey.withOpacity(0.5),
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyles().bold.copyWith(
              fontSize: sizes.fontRatio * 12,
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().textGrey.withOpacity(0.5),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().textGrey.withOpacity(0.5),
          ),
        ),
        errorStyle: TextStyles().bold.copyWith(
              fontSize: sizes.fontRatio * 12,
              color: AppColors().redShade2,
            ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors().textGrey.withOpacity(0.5),
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {},
      validator: (value) {
        if (value!.trim().isEmpty) {
          return widget.validatorText;
        }
        if (widget.labelText == email) {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2}').hasMatch(value)) {
            return invalidEmail;
          }
        }
        if (widget.labelText == password ||
            widget.labelText == createPassword) {
          if (value.trim().length < 5) {
            return passwordMustNotBeLessThan5;
          }
        }
        return widget.onValidate(value);
      },
    );
  }
}
