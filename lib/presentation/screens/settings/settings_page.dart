import 'package:paynest_flutter_app/export.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(
          IsBioMetricEnable(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: verticalValue(240),
            child: Stack(
              children: [
                Container(
                  height: verticalValue(172),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.dropShadow.withOpacity(.3),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(
                          0,
                          5,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      setting,
                      style: textStyles.bold.copyWith(
                        color: colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: sizes.fontRatio * 18,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: sizes.heightRatio * 100,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(30),
                      vertical: verticalValue(25),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalValue(12),
                      vertical: verticalValue(10),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: colors.dropShadow.withOpacity(.3),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(
                            0,
                            5,
                          ), // changes position of shadow
                        ),
                      ],
                      color: colors.white,
                      borderRadius: BorderRadius.circular(
                        26,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return state.authenticationResponseModel.parent
                                            .profileImage ==
                                        null &&
                                    state.authenticationResponseModel.parent
                                            .profileImage !=
                                        ""
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      state.authenticationResponseModel.parent
                                              .profileImage ??
                                          '',
                                    ),
                                  )
                                : Container(
                                    height: sizes.heightRatio * 60,
                                    width: sizes.widthRatio * 60,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: colors.lightGreyShade5,
                                            blurRadius: 5,
                                            offset: const Offset(
                                              0.5, // Move to right 10  horizontally
                                              0.5, // Move to bottom 10 Vertically
                                            ),
                                          )
                                        ]),
                                    child: SvgPicture.asset(
                                      assets.icMale,
                                    ),
                                  );
                          },
                        ),
                        horizontalSpacer(16),
                        BlocBuilder<DashboardBloc, DashboardState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.firstName} ${state.lastName}',
                                  style: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 18,
                                    color: colors.black,
                                  ),
                                ),
                                verticalSpacer(4),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const MyProfile(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    viewprofile,
                                    style: textStyles.semiBold.copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        payments,
                        style: textStyles.bold.copyWith(
                          color: colors.black,
                          fontSize: sizes.fontRatio * 16,
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: assets.icPaymentHistory,
                      value: paymentHistory,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RecentTransactionPage(
                              whichStack: "other",
                            ),
                          ),
                        );
                      },
                    ),
                    verticalSpacer(16),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    verticalSpacer(16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        general,
                        style: textStyles.bold.copyWith(
                          color: colors.black,
                          fontSize: sizes.fontRatio * 16,
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                    BlocBuilder<DashboardBloc, DashboardState>(
                        builder: (context, state) {
                      return SingleCardWithRadioButton(
                        value: biometricAuth,
                        icon: assets.icFingerPrint,
                        isEnable: state.isBioMetricEnable,
                        onTap: (value) {
                          context.read<DashboardBloc>().add(
                                RadioButtonOnTap(value: value),
                              );
                        },
                      );
                    }),
                    verticalSpacer(16),
                    // SingleCardWithRadioButton(
                    //   value: Location,
                    //   isEnable: false,
                    //   icon: icLocation,
                    //   onTap: () {},
                    // ),
                    verticalSpacer(16),
                    // LanguageCard(),
                    verticalSpacer(16),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      width: horizontalValue(1),
                      height: verticalValue(1),
                      color: colors.white,
                    ),
                    verticalSpacer(16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Text(
                        privacy,
                        style: textStyles.bold.copyWith(
                          color: colors.black,
                          fontSize: sizes.fontRatio * 16,
                        ),
                      ),
                    ),
                    verticalSpacer(12),
                    SingleCard(
                      icon: assets.icFaq,
                      value: fAQs,
                      onTap: () {
                        launch(
                          'https://paynest.ae/#faq',
                        );
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: assets.icContactUs,
                      value: contactUs,
                      onTap: () {
                        launch(
                          'https://paynest.ae/#faq',
                        );
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: assets.icPrivacyPolicy,
                      value: privacyPolicy,
                      onTap: () {
                        launch(
                          'https://paynest.ae/privacy-policy.html',
                        );
                      },
                    ),
                    verticalSpacer(16),
                    SingleCard(
                      icon: assets.icTermsAndCondition,
                      value: termConditions,
                      onTap: () {
                        launch(
                          'https://paynest.ae/terms.html',
                        );
                      },
                    ),
                    verticalSpacer(16),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: horizontalValue(16),
                    //   ),
                    //   width: horizontalValue(1),
                    //   height: verticalValue(1),
                    //   color: colors.white,
                    // ),
                    verticalSpacer(5),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: colors.redShade2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const WelcomePage(),
                            ),
                            (Route route) => false,
                          );
                        },
                        child: Text(
                          signOut,
                          style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 14,
                            color: colors.white,
                          ),
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
