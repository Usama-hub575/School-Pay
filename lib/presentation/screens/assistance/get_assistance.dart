import 'package:paynest_flutter_app/export.dart';

class GetAssistancePage extends StatefulWidget {
  const GetAssistancePage({Key? key}) : super(key: key);

  @override
  State<GetAssistancePage> createState() => _GetAssistancePageState();
}

class _GetAssistancePageState extends State<GetAssistancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: sizes.heightRatio * 150,
            decoration: BoxDecoration(
              color: colors.primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(
                  24,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: horizontalValue(
                    25,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: horizontalValue(
                              25,
                            ),
                          ),
                          child: Container(
                            height: verticalValue(44),
                            width: horizontalValue(44),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: colors.lightGreyShade4,
                                  blurRadius: 2.0,
                                  offset: const Offset(
                                    3.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: colors.primaryColor,
                              ),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        Text(
                          assistance,
                          style: textStyles.bold.copyWith(
                            color: colors.white,
                            fontSize: sizes.fontRatio * 18,
                          ),
                        ),
                        SizedBox(
                          height: verticalValue(44),
                          width: horizontalValue(44),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpacer(24),
          InkWell(
            onTap: () {
              launchUrl(
                Uri.parse(
                  'https://paynest.ae/#contact',
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colors.primaryColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: sizes.heightRatio * 80,
                    width: sizes.widthRatio * 80,
                    child: Lottie.asset(
                      assets.customerSupportAnimation,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contactCustomerCare,
                          style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: colors.primaryColor,
                          ),
                        ),
                        verticalSpacer(8),
                        Wrap(
                          children: [
                            Text(
                              shareYourQuery,
                              maxLines: 2,
                              style: textStyles.regular.copyWith(
                                fontSize: sizes.fontRatio * 10,
                                color: colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(24),
          InkWell(
            onTap: () {
              launchUrl(
                Uri.parse(
                  'https://paynest.ae/#faq',
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colors.primaryColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: sizes.heightRatio * 80,
                    width: sizes.widthRatio * 80,
                    child: Lottie.asset(
                      assets.faqAnimation,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fAQs,
                          style: textStyles.bold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: colors.primaryColor,
                          ),
                        ),
                        verticalSpacer(8),
                        SizedBox(
                          width: sizes.widthRatio * 280,
                          child: Text(
                            goThrough,
                            style: textStyles.regular.copyWith(
                              fontSize: sizes.fontRatio * 10,
                              color: colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(24),
          BlocConsumer<GetAssistanceBloc, GetAssistanceState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<GetAssistanceBloc>().add(
                        OpenWhatsApp(),
                      );
                  // openWhatsapp();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalValue(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                    vertical: verticalValue(16),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colors.primaryColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: sizes.heightRatio * 80,
                        width: sizes.widthRatio * 80,
                        child: Lottie.asset(
                          assets.commentAnimation,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              liveChat,
                              style: textStyles.bold.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: colors.primaryColor,
                              ),
                            ),
                            verticalSpacer(8),
                            SizedBox(
                              width: sizes.widthRatio * 280,
                              child: Text(
                                chatWith,
                                style: textStyles.regular.copyWith(
                                  fontSize: sizes.fontRatio * 10,
                                  color: colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              switch (state.status) {
                case GetAssistanceStatus.init:
                  // TODO: Handle this case.
                  break;
                case GetAssistanceStatus.showToast:
                  showToast(
                    context: context,
                    message: whatsAppNotInstalled,
                    color: colors.red,
                  );
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  // openWhatsapp() async {
  //   var whatsapp = "+971525919430";
  //   var whatsappUrlAndroid = "whatsapp://send?phone=$whatsapp&text=hello";
  //   var whatAppUrlIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  //   if (Platform.isIOS) {
  //     // for iOS phone only
  //     if (await canLaunchUrl(
  //       Uri.parse(whatAppUrlIOS),
  //     )) {
  //       await launch(whatAppUrlIOS, forceSafariVC: false);
  //     } else {
  //       showToast(
  //         context: context,
  //         message: 'Whatsapp not installed',
  //         color: PayNestTheme.red,
  //       );
  //     }
  //   } else {
  //     await launchUrl(
  //       Uri.parse(whatsappUrlAndroid),
  //     );
  //   }
  // }
}
