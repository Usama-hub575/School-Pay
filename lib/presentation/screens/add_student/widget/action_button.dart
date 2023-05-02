import 'package:paynest_flutter_app/export.dart';

class ActionButton extends StatefulWidget {
  final Function onTap;

  const ActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddStudentBloc, AddStudentState>(
        builder: (context, state) {
      return InkWellWidget(
        onTap: () => widget.onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(12),
            vertical: verticalValue(6),
          ),
          decoration: BoxDecoration(
            color: colors.primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            state.selectedFilter == 'Account Number' ||
                    state.selectedFilter == 'Student ID'
                ? 'Add'
                : 'Verify & Add',
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 9,
              color: colors.white,
            ),
          ),
        ),
      );
    });
  }
}
