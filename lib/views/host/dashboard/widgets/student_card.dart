import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../constants/constants.dart';
import '../../../../data/model/mystudents_resp_model.dart';
import '../../../../presentation/res/res.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({
    Key? key,
    required this.students,
    required this.onTap,
  }) : super(key: key);

  final List<StudentElement> students;
  final Function(StudentElement studentElement) onTap;

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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

  Widget _singleCard(StudentElement studentElement, int index) {
    return Container(
      child: Stack(
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
                  ? PayNestTheme.primaryColor.withOpacity(0.5)
                  : PayNestTheme.primaryColor.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Container(
                  height: sizes.heightRatio * 60,
                  width: sizes.widthRatio * 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    studentElement.student?.gender == "male" ? icMale : icFemale,
                  ),
                ),
                verticalSpacer(6),

                Container(
                  width: sizes.widthRatio * 60,
                  child: Text(
                    '${studentElement.student?.firstName ?? '' + studentElement.student!.lastName != '-'}',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontSize: sizes.fontRatio * 13,
                      color: index % 2 == 0
                          ? PayNestTheme.colorWhite
                          : PayNestTheme.black,
                    ),
                  ),
                ),
                verticalSpacer(6),
                Container(
                  width: sizes.widthRatio * 80,
                  child: Text(
                    '${studentElement.student?.school!.name}',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: PayNestTheme.small_2_10textGrey.copyWith(
                      fontSize: sizes.fontRatio * 8,
                      color: index % 2 == 0
                          ? PayNestTheme.colorWhite
                          : PayNestTheme.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              icAdd,
            ),
          ),
        ],
      ),
    );
  }
}
