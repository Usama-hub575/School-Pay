import 'package:paynest_flutter_app/export.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    Key? key,
    required this.onChange,
    required this.controller,
    required this.labelText,
    required this.validatorText,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  final Function(String value) onChange;
  final TextEditingController controller;
  final String labelText;
  final String validatorText;
  final bool obscureText;
  final IconButton? icon;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return invalidEmail;
          }
        }
        if (widget.labelText == password ||
            widget.labelText == createPassword) {
          if (value.trim().length < 4) {
            return passwordMustNotBeLessThan5;
          }
        }
        return widget.onChange(value);
        // return null;
        // if (widget.labelText == confirmPassword) {
        //   if (widget.passwordController?.text !=
        //       widget.confirmPasswordController?.text) {
        //     return passwordNotMatched;
        //   }
      },
    );
  }
}
