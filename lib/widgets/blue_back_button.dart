import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class BlueBackButton extends StatefulWidget {
  BuildContext context;

  BlueBackButton({Key? key, required this.context}) : super(key: key);

  @override
  State<BlueBackButton> createState() => _BlueBackButtonState();
}

class _BlueBackButtonState extends State<BlueBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(widget.context);
      },
      child: Container(
          height: 44.h,
          width: 44.w,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.11.r),
              color: PayNestTheme.blueAccent
          ),
          child: Icon(Icons.arrow_back,size: 18.sp,
              color: PayNestTheme.colorWhite
          )
      ),
    );
  }
}
