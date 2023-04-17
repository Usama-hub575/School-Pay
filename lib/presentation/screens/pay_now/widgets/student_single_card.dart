import 'package:paynest_flutter_app/export.dart';

class StudentSingleCard extends StatefulWidget {
  const StudentSingleCard({
    Key? key,
    required this.studentData,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final StudentData studentData;
  final Function onTap;
  final int index;

  @override
  State<StudentSingleCard> createState() => _StudentSingleCardState();
}

class _StudentSingleCardState extends State<StudentSingleCard> {
  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: () => widget.onTap(widget.studentData),
      child: Opacity(
        opacity: widget.studentData.isSelected ? 1 : 0.5,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: verticalValue(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(12),
                vertical: verticalValue(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: colors.primaryColor.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  Container(
                    height: sizes.heightRatio * 50,
                    width: sizes.widthRatio * 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      widget.studentData.student?.gender == "male"
                          ? assets.icMale
                          : assets.icFemale,
                    ),
                  ),
                  verticalSpacer(8),
                  SizedBox(
                    width: sizes.widthRatio * 60,
                    child: Text(
                      '${widget.studentData.student?.firstName} \n  ${(widget.studentData.student?.lastName != '-' ? widget.studentData.student?.lastName : '')}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 13,
                        color:
                            widget.index % 2 == 0 ? colors.white : colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: sizes.widthRatio * 80,
                    child: Text(
                      '${widget.studentData.student?.school!.name}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: textStyles.regular.copyWith(
                        fontSize: sizes.fontRatio * 10,
                        color:
                            widget.index % 2 == 0 ? colors.white : colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                assets.icAdd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
