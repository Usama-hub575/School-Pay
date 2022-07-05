import 'package:flutter/material.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../../model/mystudents_resp_model.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({Key? key, required this.students}) : super(key: key);

  final List<StudentElement> students;

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(12),
      ),
      height: sizes.heightRatio * 155,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _singleCard();
        },
        separatorBuilder: (context, index) {
          return horizontalSpacer(12);
        },
        itemCount: 3,
      ),
    );
  }

  Widget _singleCard() {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: verticalValue(10),
            ),
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
                  minRadius: 12,
                  maxRadius: 16,
                ),
                verticalSpacer(12),
                Text(
                  'John \n Allan',
                  textAlign: TextAlign.center,
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: sizes.fontRatio * 12,
                    color: PayNestTheme.colorWhite,
                  ),
                ),
                verticalSpacer(8),
                Container(
                  width: sizes.widthRatio * 80,
                  child: Text(
                    'Gems Winchester School',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontSize: sizes.fontRatio * 11,
                      color: PayNestTheme.colorWhite,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: PayNestTheme.primaryColor,
              radius: 16,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: PayNestTheme.colorWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
