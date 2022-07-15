import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../constants/constants.dart';
import '../../../../model/mystudents_resp_model.dart';

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
          return GestureDetector(
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
              color: PayNestTheme.primaryColor.withOpacity(0.5),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.dribbble.com/users/1973964/screenshots/8807446/admissions_4x.jpg',
                  ),
                  minRadius: 16,
                  maxRadius: 24,
                ),
                verticalSpacer(12),
                Text(
                  '${studentElement.student?.firstName} \n ${studentElement.student?.lastName} ',
                  textAlign: TextAlign.center,
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: sizes.fontRatio * 14,
                    color: index % 2 == 0
                        ? PayNestTheme.colorWhite
                        : PayNestTheme.black,
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
                      fontSize: sizes.fontRatio * 11,
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
