part of 'initializer_bloc.dart';

class InitializerState extends Equatable {
  InitializerStatus status;
  int languageIndex = 0;
  bool showCancelButton = false;

  InitializerState({
    this.status = InitializerStatus.loading,
    this.languageIndex = 0,
    this.showCancelButton = false,
  });

  InitializerState copyWith({
    InitializerStatus status = InitializerStatus.loading,
    int? languageIndex,
    bool? showCancelButton,
  }) {
    return InitializerState(
      status: status,
      languageIndex: languageIndex ?? this.languageIndex,
      showCancelButton: showCancelButton ?? this.showCancelButton,
    );
  }

  @override
  List<Object?> get props => [
        status,
        showCancelButton,
        languageIndex,
      ];
}
