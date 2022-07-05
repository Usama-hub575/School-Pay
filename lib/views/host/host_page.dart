import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/dashboard/dashboard.dart';
import 'package:paynest_flutter_app/views/host/more/more_page.dart';
import 'package:paynest_flutter_app/views/host/pay/paynow_page.dart';
import 'package:paynest_flutter_app/views/host/student/student_page.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int pageIndex = 0;
  int payNow = 0;
  bool bottomTabIsActive = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final pages = [
    const DashboardPage(),
    StudentPage(whichStack: "host"),
    RecentTransactionPage(whichStack: "host"),
    const MorePage(),
  ];

  final pay = [
    PayNowPage(whichStack: 'host'),
  ];

  final selectedIcons = <String>[
    ic_dashboard_non,
    ic_student_non,
    ic_transaction_non,
    ic_menu_non,
  ];

  final unSelectedIcons = <String>[
    ic_dashboard,
    ic_student,
    ic_transaction,
    ic_menu,
  ];

  final names = <String>[
    'Dashboard',
    'Student',
    'Transactions',
    'More',
  ];

  selectedNavItem(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: () async => false,
        child: payNow == -1 ? pay[0] : pages[pageIndex],
      ),
      floatingActionButton: Container(
        height: 70.h,
        width: 70.h,
        child: FloatingActionButton.extended(
          backgroundColor: PayNestTheme.primaryColor,
          onPressed: () {
            payNow = -1;
            bottomTabIsActive = false;
            setState(() {});
          },
          label: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(4),
            ),
            child: Text(
              paynow,
              maxLines: 2,
              style: PayNestTheme.floating_12primaryColor.copyWith(
                color: PayNestTheme.colorWhite,
                fontSize: sizes.fontRatio * 12,
              ),
            ),
          ), //icon inside button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: SafeArea(
      //   bottom: true,
      //   child: Container(
      //     height: 70.h,
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).primaryColor,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20.r),
      //         topRight: Radius.circular(20.r),
      //       ),
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20.r),
      //         topRight: Radius.circular(20.r),
      //       ),
      //       child: BottomNavigationBar(
      //         backgroundColor: PayNestTheme.primaryColor,
      //         currentIndex: pageIndex,
      //         selectedLabelStyle: PayNestTheme.navbar12,
      //         unselectedLabelStyle:PayNestTheme.navbar12,
      //         // fixedColor: PayNestTheme.colorWhite,
      //         selectedItemColor: PayNestTheme.colorWhite,
      //         unselectedItemColor:PayNestTheme.colorWhite,
      //         type: BottomNavigationBarType.fixed,
      //         onTap: (index)=>selectedNavItem(index),
      //         items: [
      //           BottomNavigationBarItem(
      //               icon: Image.asset(pageIndex == 0 ? ic_dashboard_non : ic_dashboard,height: 15.sp),
      //               label: 'Dashboard'
      //           ),
      //           BottomNavigationBarItem(
      //               icon: Image.asset(pageIndex == 1 ? ic_student_non:ic_student,height: 15.sp),
      //               label: 'Student',
      //           ),
      //           BottomNavigationBarItem(
      //               icon: Text(''),
      //               label: ''
      //           ),
      //            BottomNavigationBarItem(
      //               icon: Image.asset(pageIndex == 3 ? ic_transaction_non:ic_transaction ,height: 15.sp),
      //               label: 'Transactions'
      //           ),
      //            BottomNavigationBarItem(
      //               icon: Image.asset(pageIndex == 4 ? ic_menu_non:ic_menu ,height: 15.sp),
      //               label: 'More'
      //           ),
      //         ],
      //       ),
      //     )
      //   ),
      // ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: selectedIcons.length,
        tabBuilder: (int index, bool isActive) {
          bottomTabIsActive = isActive;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                bottomTabIsActive ? selectedIcons[index] : unSelectedIcons[index],
                height: sizes.heightRatio * 26,
                width: sizes.widthRatio * 26,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${names[index]}",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizes.fontRatio * 10,
                  ),
                ),
              )
            ],
          );
        },
        backgroundColor: PayNestTheme.primaryColor,
        activeIndex: pageIndex,
        splashColor: PayNestTheme.blueAccent,
        // notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.sharpEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          payNow = 0;
          selectedNavItem(index);
        },
        // hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.grey,
        ),
      ),
    );
  }
}
