import '../export.dart';

class TextStyles {
  final regular = TextStyle(
    fontWeight: FontWeight.w400,
    color: colors.darkText,
    fontFamily: "montserratRegular",
  );

  final medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: colors.darkText,
    fontFamily: "montserratMedium",
  );

  final semiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: colors.darkText,
  );

  final bold = TextStyle(
    fontWeight: FontWeight.bold,
    color: colors.darkText,
    fontFamily: "montserratBold",
  );

  final extraBold = TextStyle(
    fontWeight: FontWeight.w900,
    color: colors.darkText,
    fontFamily: "montserratExtraBold",
  );
}
