import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:paynest_flutter_app/export.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final selectedIcons = <String>[
    assets.icDashboardSelected,
    assets.icStudent,
    assets.icTransaction,
    assets.icMenu,
  ];

  final unSelectedIcons = <String>[
    assets.icDashboardNon,
    assets.icStudentNon,
    assets.icTransactionNon,
    assets.icMenuNon,
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
    context.read<HostBloc>().add(
          SelectNavigationBarItem(
            status: HostStatus.dashBoardPage,
          ),
        );
    // pages = [];
    // initializePages();
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocBuilder<HostBloc, HostState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          body: WillPopScope(
            onWillPop: () async => false,
            child: navigatePage(state.status, state.stack),
          ),
          floatingActionButton: SizedBox(
            height: sizes.heightRatio * 64,
            width: sizes.heightRatio * 64,
            child: Visibility(
              visible: !showFab,
              child: FloatingActionButton.extended(
                backgroundColor: colors.primaryColor,
                onPressed: () {
                  context.read<HostBloc>().add(
                        FloatingActionButtonOnPressed(),
                      );
                },
                label: Text(
                  paynow,
                  textAlign: TextAlign.center,
                  style: textStyles.bold.copyWith(
                    fontSize: sizes.fontRatio * 12,
                    color: state.payNowButton == true
                        ? colors.paidGreen
                        : colors.white,
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
                    state.bottomTabIsActive && state.payNowButton == false
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
              state.payNowButton = false;
              context.read<HostBloc>().add(
                    ChangePageIndex(pageIndex: index, stack: "host"),
                  );
            },
            shadow: BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0.5,
              color: colors.greyShade,
            ),
          ),
        );
      },
    );
  }

  navigatePage(HostStatus status, String stack) {
    switch (status) {
      case HostStatus.dashBoardPage:
        return const DashboardPage();
      case HostStatus.studentPage:
        return StudentPage(whichStack: stack);
      case HostStatus.recentTransactionPage:
        return RecentTransactionPage(whichStack: stack);
      case HostStatus.settingsPage:
        return const SettingsPage();
      case HostStatus.payNowPage:
        return PayNowPage(whichStack: stack);
      default:
        return const DashboardPage();
    }
  }
}
