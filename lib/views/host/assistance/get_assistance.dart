import 'package:paynest_flutter_app/export.dart';

class GetAssistance extends StatefulWidget {
  const GetAssistance({Key? key}) : super(key: key);

  @override
  State<GetAssistance> createState() => _GetAssistanceState();
}

class _GetAssistanceState extends State<GetAssistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: sizes.heightRatio * 150,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24.r))),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          assistance,
                          style: PayNestTheme.title20white.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'montserratBold',
                            fontSize: sizes.fontRatio * 18,
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                          width: 44.w,
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
                horizontal: horizontalValue(8),
                vertical: verticalValue(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: PayNestTheme.primaryColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: sizes.heightRatio * 80,
                    width: sizes.widthRatio * 80,
                    child: Lottie.asset(
                      AppAssets().customerSupportAnimation,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contactCustomerCare,
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(8),
                        Wrap(
                          children: [
                            Text(
                              shareYourQuery,
                              maxLines: 2,
                              style: PayNestTheme.small_2_12black.copyWith(
                                fontSize: sizes.fontRatio * 10,
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
                  color: PayNestTheme.primaryColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: sizes.heightRatio * 80,
                    width: sizes.widthRatio * 80,
                    child: Lottie.asset(
                      AppAssets().faqAnimation,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fAQS,
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(8),
                        SizedBox(
                          width: sizes.widthRatio * 280,
                          child: Text(
                            goThrough,
                            style: PayNestTheme.small_2_12black.copyWith(
                              fontSize: sizes.fontRatio * 10,
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
          InkWell(
            onTap: () {
              openWhatsapp();
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
                  color: PayNestTheme.primaryColor,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: sizes.heightRatio * 56,
                    width: sizes.widthRatio * 56,
                    child: Lottie.asset(
                      AppAssets().commentAnimation,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          liveChat,
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(8),
                        SizedBox(
                          width: sizes.widthRatio * 280,
                          child: Text(
                            chatWith,
                            style: PayNestTheme.small_2_12black.copyWith(
                              fontSize: sizes.fontRatio * 10,
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
        ],
      ),
    );
  }

  openWhatsapp() async {
    var whatsapp = "+971525919430";
    var whatsappUrlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatAppUrlIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(
        Uri.parse(whatAppUrlIOS),
      )) {
        await launch(whatAppUrlIOS, forceSafariVC: false);
      } else {
        showToast(
          context: context,
          message: 'Whatsapp not installed',
          color: PayNestTheme.red,
        );
      }
    } else {
      await launchUrl(
        Uri.parse(whatsappUrlAndroid),
      );
    }
  }
}
