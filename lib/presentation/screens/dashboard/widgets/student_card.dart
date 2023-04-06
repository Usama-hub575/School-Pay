import 'package:paynest_flutter_app/export.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({
    Key? key,
    required this.students,
    required this.onTap,
  }) : super(key: key);

  final List<StudentData> students;
  final Function(StudentData studentElement) onTap;

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizes.heightRatio * 180,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => widget.onTap(
              widget.students[index],
            ),
            child: _singleCard(
              widget.students[index],
              index,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return horizontalSpacer(12);
        },
        itemCount: widget.students.length > 3 ? 3 : widget.students.length,
      ),
    );
  }

  Widget _singleCard(StudentData studentData, int index) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: verticalValue(10),
          ),
          height: sizes.heightRatio * 155,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(12),
            vertical: verticalValue(16),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: index % 2 == 0
                ? colors.primaryColor.withOpacity(0.5)
                : colors.primaryColor.withOpacity(0.2),
          ),
          child: Column(
            children: [
              Container(
                height: sizes.heightRatio * 60,
                width: sizes.widthRatio * 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  studentData.student?.gender == "male"
                      ? assets.icMale
                      : assets.icFemale,
                ),
              ),
              verticalSpacer(6),
              SizedBox(
                width: sizes.widthRatio * 60,
                child: Text(
                  '${studentData.student?.firstName ?? studentData.student!.lastName != '-'}',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.bold.copyWith(
                    fontSize: sizes.fontRatio * 13,
                    color: index % 2 == 0 ? colors.white : colors.black,
                  ),
                ),
              ),
              verticalSpacer(6),
              SizedBox(
                width: sizes.widthRatio * 80,
                child: Text(
                  '${studentData.student?.school!.name}',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: textStyles.regular.copyWith(
                    fontSize: sizes.fontRatio * 8,
                    color: index % 2 == 0 ? colors.white : colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        Positioned(
          bottom: 4,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            assets.icAdd,
          ),
        ),
      ],
    );
  }
}
