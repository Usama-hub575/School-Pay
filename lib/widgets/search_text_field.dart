import 'package:paynest_flutter_app/export.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.primaryColor,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.dropShadow.withOpacity(.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(
              0,
              5,
            ), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: colors.primaryColor,
          ),
          horizontalSpacer(12),
          Expanded(
            child: TextFormField(
              onTap: () {
                //onSearchTextChanged;
              },
              controller: controller,
              onChanged: (value) {
                onChanged(value);
              },
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 14,
                color: colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: searchStudent,
                labelStyle: textStyles.regular.copyWith(
                  fontSize: sizes.fontRatio * 12,
                  color: colors.lightGreyShade.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
