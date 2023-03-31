import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/more/more_page.dart';
import 'package:paynest_flutter_app/views/host/pay/paynow_page.dart';
import 'package:paynest_flutter_app/views/host/student/student_page.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../presentation/res/res.dart';

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

  List<Widget> pages = [];

  final pay = [
    const PayNowPage(whichStack: 'host'),
  ];

  final selectedIcons = <String>[
    AppAssets().ic_dashboard,
    AppAssets().ic_student,
    AppAssets().ic_transaction,
    AppAssets().ic_menu,
  ];

  final unSelectedIcons = <String>[
    AppAssets().ic_dashboard_non,
    AppAssets().ic_student_non,
    AppAssets().ic_transaction_non,
    AppAssets().ic_menu_non,
  ];

  final names = <String>[
    'Dashboard',
    'Payees',
    'Transactions',
    'Setting',
  ];

  selectedNavItem(index) {
    setState(() {
      pageIndex = index;
    });
  }

  initializePages() {
    // pages.add(
    //   DashboardPage(
    //     onTap: () {
    //       selectedNavItem(1);
    //     },
    //     onRecentTransactionTap: () {
    //       selectedNavItem(2);
    //     },
    //   ),
    // );
    pages.add(
      StudentPage(whichStack: "host"),
    );
    pages.add(
      RecentTransactionPage(whichStack: "host"),
    );
    pages.add(
      const MorePage(),
    );
  }

  @override
  void initState() {
    super.initState();
    pages = [];
    initializePages();
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: () async => false,
        child: payNow == -1 ? pay[0] : pages[pageIndex],
      ),
      floatingActionButton: Container(
        height: 64.h,
        width: 64.h,
        child: Visibility(
          visible: !showFab,
          child: FloatingActionButton.extended(
            backgroundColor: PayNestTheme.primaryColor,
            onPressed: () {
              payNow = -1;
              bottomTabIsActive = false;
              setState(() {});
            },
            label: Text(
              paynow,
              textAlign: TextAlign.center,
              style: PayNestTheme.floating_12primaryColor.copyWith(
                color: PayNestTheme.colorWhite,
                fontSize: sizes.fontRatio * 12,
              ),
            ), //icon inside button
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: selectedIcons.length,
        tabBuilder: (int index, bool isActive) {
          bottomTabIsActive = isActive;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                bottomTabIsActive
                    ? selectedIcons[index]
                    : unSelectedIcons[index],
              ),
              verticalSpacer(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${names[index]}",
                    maxLines: 1,
                    style: PayNestTheme.navbar12.copyWith(
                      fontSize: sizes.fontRatio * 8,
                    )),
              )
            ],
          );
        },
        backgroundColor: PayNestTheme.primaryColor,
        activeIndex: pageIndex,
        splashColor: PayNestTheme.blueAccent,
        splashSpeedInMilliseconds: 0,
        notchMargin: sizes.heightRatio * 8,
        hideAnimationCurve: Curves.linear,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        onTap: (index) {
          payNow = 0;
          selectedNavItem(index);
        },
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.grey,
        ),
      ),
    );
  }
}
