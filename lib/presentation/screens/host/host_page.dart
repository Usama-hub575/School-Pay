import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:paynest_flutter_app/export.dart';
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
  // int pageIndex = 0;
  // int payNow = 0;
  // bool bottomTabIsActive = false;
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

  // selectedNavItem(index) {
  //   setState(() {
  //     pageIndex = index;
  //   });
  // }
  //
  // initializePages() {
  //   pages.add(
  //     DashboardPage(
  //       onTap: () {
  //         selectedNavItem(1);
  //       },
  //       onRecentTransactionTap: () {
  //         selectedNavItem(2);
  //       },
  //     ),
  //   );
  //   pages.add(
  //     StudentPage(whichStack: "host"),
  //   );
  //   pages.add(
  //     RecentTransactionPage(whichStack: "host"),
  //   );
  //   pages.add(
  //     const MorePage(),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    context.read<HostPageBloc>().add(
          ChangePage(
            status: HostPageStatus.dashBoardPage,
          ),
        );
    // pages = [];
    // initializePages();
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocBuilder<HostPageBloc, HostPageState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          body: WillPopScope(
            onWillPop: () async => false,
            child: navPage(state.status),
          ),
          floatingActionButton: SizedBox(
            height: sizes.heightRatio * 64,
            width: sizes.heightRatio * 64,
            child: Visibility(
              visible: !showFab,
              child: FloatingActionButton.extended(
                backgroundColor: colors.primaryColor,
                onPressed: () {
                  context.read<HostPageBloc>().add(
                        FloatingActionButtonOnPressed(),
                      );
                },
                label: Text(
                  paynow,
                  textAlign: TextAlign.center,
                  style: textStyles.bold.copyWith(
                    color: colors.white,
                    fontSize: sizes.fontRatio * 12,
                  ),
                ), //icon inside button
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: selectedIcons.length,
            tabBuilder: (int index, bool isActive) {
              state.bottomTabIsActive = isActive;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    state.bottomTabIsActive
                        ? selectedIcons[index]
                        : unSelectedIcons[index],
                  ),
                  verticalSpacer(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      names[index],
                      maxLines: 1,
                      style: textStyles.semiBold.copyWith(
                        fontSize: sizes.fontRatio * 8,
                        color: colors.white,
                      ),
                    ),
                  )
                ],
              );
            },
            backgroundColor: colors.primaryColor,
            activeIndex: state.pageIndex,
            splashColor: colors.blueAccent,
            splashSpeedInMilliseconds: 0,
            notchMargin: sizes.heightRatio * 8,
            hideAnimationCurve: Curves.linear,
            notchSmoothness: NotchSmoothness.softEdge,
            gapLocation: GapLocation.center,
            leftCornerRadius: 16,
            rightCornerRadius: 16,
            onTap: (index) {
              state.payNow = 0;
              // selectedNavItem(index);
            },
            shadow: const BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0.5,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  navPage(HostPageStatus status) {
    switch (status) {
      case HostPageStatus.dashBoardPage:
        return const DashboardPage();
      case HostPageStatus.studentPage:
        return StudentPage(whichStack: "host");
      case HostPageStatus.recentTransactionPage:
        return RecentTransactionPage(whichStack: "host");
      case HostPageStatus.morePage:
        return const MorePage();
      default:
        return const DashboardPage();
    }
  }
}
