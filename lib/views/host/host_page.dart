import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/dashboard/dashboard.dart';
import 'package:paynest_flutter_app/views/host/more/more_page.dart';
import 'package:paynest_flutter_app/views/host/pay/paynow_page.dart';
import 'package:paynest_flutter_app/views/host/student/student_page.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int pageIndex = 0;

  final pages = [
    const DashboardPage(),
    const StudentPage(),
    const PayNowPage(),
    const RecentTrasactionPage(),
    const MorePage(),

  ];

  selectedNavItem(index) {
    setState(() {
      pageIndex = index;
      // if (index == 8) {
      //   navSelected = true;
      //   currentIndex = 5;
      //   // Utils.scaffoldKeyUser.currentState!.openEndDrawer();
      // } else {
      //   navSelected = false;
      //   currentIndex = index;
      //   selectedPage = pageKeys[index];
      //   Utils.hostMainKey.currentState!.pushNamed(selectedPage);
      //   print(selectedPage);
      // }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],

      floatingActionButton:Container(
        height: 70.h,
        width: 70.h,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (){
            selectedNavItem(2);
          },
          child: Text(paynow,style: PayNestTheme.floating_12primaryColor),//icon inside button
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomNavigationBar(
            backgroundColor: PayNestTheme.primaryColor,
            currentIndex: pageIndex,
            selectedLabelStyle: PayNestTheme.navbar12,
            unselectedLabelStyle:PayNestTheme.navbar12,
            // fixedColor: PayNestTheme.colorWhite,
            selectedItemColor: PayNestTheme.colorWhite,
            unselectedItemColor:PayNestTheme.colorWhite,
            type: BottomNavigationBarType.fixed,
            onTap: (index)=>selectedNavItem(index),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(pageIndex == 0 ? ic_dashboard_non : ic_dashboard,height: 15.sp),
                  label: 'Dashboard'
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(pageIndex == 1 ? ic_student_non:ic_student,height: 15.sp),
                  label: 'Student',
              ),
              BottomNavigationBarItem(
                  icon: Text(''),
                  label: ''
              ),
               BottomNavigationBarItem(
                  icon: Image.asset(pageIndex == 3 ? ic_transaction_non:ic_transaction ,height: 15.sp),
                  label: 'Transactions'
              ),
               BottomNavigationBarItem(
                  icon: Image.asset(pageIndex == 4 ? ic_menu_non:ic_menu ,height: 15.sp),
                  label: 'More'
              ),
            ],
          ),
        )
      ),
    );
  }
}
