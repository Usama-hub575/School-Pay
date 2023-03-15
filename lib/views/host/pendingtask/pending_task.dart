import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';

import '../../../widgets/not_found_widget.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({Key? key}) : super(key: key);

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => userController.userResData.value.parent!.pin == null
                ? Container(
                    height: 129.h,
                    decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(24.r),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 25.h),
                                  child: Container(
                                    height: 44.h,
                                    width: 44.w,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 2.0,
                                          offset: Offset(
                                            3.0, // Move to right 10  horizontally
                                            3.0, // Move to bottom 10 Vertically
                                          ),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 20.sp,
                                        color: PayNestTheme.primaryColor,
                                      ),
                                      // child: Text(""),
                                    ),
                                  ),
                                ),
                                Text(
                                  pendingTask,
                                  textAlign: TextAlign.center,
                                  style: PayNestTheme.title20white.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserratBold',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Obx(
            () => userController.userResData.value.parent!.pin == null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  width: 1.w, color: PayNestTheme.lineColor)),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ChangePIN()));
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecentTrasactionPage()));
                          },
                          title: Text(
                            setPIN,
                            style: PayNestTheme.title_3_16black,
                          ),
                          trailing: SvgPicture.asset(AppAssets().arrowNext),
                          subtitle: Text(
                            youNeedToSetUpPin,
                            style: PayNestTheme.small_2_12textGrey,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  )
                : NoDataFound(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
