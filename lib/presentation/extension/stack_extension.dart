import 'package:paynest_flutter_app/export.dart';

enum LoadingState {
  loaded,
  loading,
}

extension ProgressLoader on Stack {
  Widget fullScreenLoader({
    required bool state,
    required loadingWidget,
    required child,
  }) {
    switch (state) {
      case false:
        return Stack(
          children: [
            child,
          ],
        );
      case true:
        return Stack(
          children: [
            child,
            loadingWidget,
          ],
        );
      default:
        return Container();
    }
  }
}
