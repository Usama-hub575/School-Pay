import 'package:paynest_flutter_app/export.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.height,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Column(
        children: [
          verticalSpacer(40),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 1.0,
                      offset: Offset(
                        1.2, // Move to right 10  horizontally
                        1.2, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                  color: PayNestTheme.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: IconButton(
                  onPressed: () {
                    onTap();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                    color: PayNestTheme.colorWhite,
                  ),
                ),
              ),
              const Spacer(),
              Image.asset(
                AppAssets().welcomeRegisterLogo,
                width: sizes.widthRatio * 120,
              ),
              const Spacer(),
              horizontalSpacer(24),
            ],
          ),
          const Spacer(),
          Container(
            width: sizes.widthRatio * 150,
            height: sizes.heightRatio * 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets().noData,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpacer(20),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              noDataText,
              style: PayNestTheme.title_3_16blackbold.copyWith(
                fontSize: sizes.fontRatio * 22,
                color: PayNestTheme.primaryColor,
                fontFamily: 'montserratBold',
              ),
            ),
          ),
          verticalSpacer(10),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              sorryWeCant,
              textAlign: TextAlign.center,
              style: PayNestTheme.title_3_16blackbold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.lightBlack,
                fontFamily: 'montserratBold',
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: PayNestTheme.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    14,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: verticalValue(14),
                ),
              ),
              onPressed: () {
                onTap();
              },
              child: Center(
                child: Text(
                  continueTo,
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: sizes.fontRatio * 14,
                    color: PayNestTheme.colorWhite,
                    fontFamily: 'montserratBold',
                  ),
                ),
              ),
            ),
          ),
          verticalSpacer(16),
        ],
      ),
    );
  }
}
