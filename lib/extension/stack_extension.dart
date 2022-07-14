import 'package:flutter/material.dart';

enum LoadingState {
  loaded,
  loading,
}

extension ProgressLoader on Stack {
  Widget fullScreenLoader({
    required LoadingState state,
    required loadingWidget,
    required child,
  }) {
    switch (state) {
      case LoadingState.loaded:
        return Stack(
          children: [
            child,
          ],
        );
      case LoadingState.loading:
        return Stack(
          children: [
            child,
            loadingWidget,
          ],
        );
    }
  }
}
