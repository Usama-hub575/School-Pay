import 'package:paynest_flutter_app/export.dart';

Widget fullScreenLoader() => Material(
      color: PayNestTheme.primaryColor.withOpacity(0.05),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.white.withOpacity(0.0),
        hoverColor: Colors.white.withOpacity(0.0),
        highlightColor: Colors.white.withOpacity(0.0),
        child: SizedBox(
          width: sizes.width,
          height: sizes.height,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(
                PayNestTheme.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
