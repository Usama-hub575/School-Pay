import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../data/model/mystudents_resp_model.dart';
import '../../../../presentation/res/res.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/inkwell_widget.dart';

class SingleStudentCard extends StatefulWidget {
  const SingleStudentCard({
    Key? key,
    required this.students,
    required this.onTap,
  }) : super(key: key);

  final List<StudentElement>? students;
  final Function(StudentElement element) onTap;

  @override
  State<SingleStudentCard> createState() => _SingleStudentCardState();
}

class _SingleStudentCardState extends State<SingleStudentCard> {
  bool isListEmpty = false;

  @override
  void initState() {
    super.initState();
    if (widget.students != null && widget.students!.isNotEmpty) {
      isListEmpty = true;
    } else {
      isListEmpty = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isListEmpty) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _singleCard(
            student: widget.students![index],
          );
        },
        separatorBuilder: (context, index) {
          return verticalSpacer(16);
        },
        itemCount: widget.students!.length,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _singleCard({required StudentElement student}) {
    return InkWellWidget(
      onTap: () => widget.onTap(student),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
          vertical: verticalValue(14),
        ),
        decoration: BoxDecoration(
          color: PayNestTheme.colorWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: PayNestTheme.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: sizes.heightRatio * 45,
              width: sizes.heightRatio * 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 9,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                student.student?.gender == 'male'
                    ? AppAssets().icMale
                    : AppAssets().icFemale,
              ),
            ),
            horizontalSpacer(12),
            Flexible(
              fit: FlexFit.loose,
              flex: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.student!.firstName +
                        (student.student?.lastName != '-'
                            ? student.student!.lastName
                            : ''),
                    softWrap: true,
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      color: PayNestTheme.black,
                      fontFamily: 'montserratBold',
                    ),
                  ),
                  verticalSpacer(4),
                  Text(
                    '${student.student!.school!.name}',
                    softWrap: true,
                    style: PayNestTheme.h2_12blueAccentLight.copyWith(
                      fontSize: sizes.fontRatio * 12,
                      color: PayNestTheme.textGrey,
                      fontFamily: 'montserratRegular',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Lottie.asset(
              AppAssets().arrowForwardAnimation,
              repeat: true,
              width: sizes.widthRatio * 26,
              height: sizes.heightRatio * 26,
            ),
          ],
        ),
      ),
    );
  }
}
