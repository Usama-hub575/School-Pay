import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarBackButton extends StatefulWidget {
  Color buttonColor;
  Color iconColor;
  AppBarBackButton({Key? key, required this.buttonColor, required this.iconColor}) : super(key: key);

  @override
  State<AppBarBackButton> createState() => _AppBarBackButtonState();
}

class _AppBarBackButtonState extends State<AppBarBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 25.w,
      ),
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: widget.iconColor,
          ),
        ),
      ),
    );
  }
}
