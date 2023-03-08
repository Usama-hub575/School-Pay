import 'package:paynest_flutter_app/export.dart';

late AppAssets assets;
late AppColors colors;
late AppLabels labels;
late AppSizes sizes;
late TextStyles textStyles;

bool _isInitialized = false;

void initializeResources({required BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
  assets = AppAssets();
  colors = AppColors();
  labels = AppLabels();
  textStyles = TextStyles();
}
