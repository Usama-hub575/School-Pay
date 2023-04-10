part of 'initializer_bloc.dart';

// ignore: must_be_immutable
class InitializerState extends Equatable {
  InitializerStatus status = InitializerStatus.loading;
  int languageIndex = 0;
  bool showCancelButton = false;
  String email = '';
  String password = '';

  InitializerState({
    this.status = InitializerStatus.loading,
    this.languageIndex = 0,
    this.showCancelButton = false,
    this.email = '',
    this.password = '',
  });

  InitializerState copyWith({
    InitializerStatus status = InitializerStatus.loading,
    int? languageIndex,
    bool? showCancelButton,
    String? email,
    String? password,
  }) {
    return InitializerState(
      status: status,
      languageIndex: languageIndex ?? this.languageIndex,
      showCancelButton: showCancelButton ?? this.showCancelButton,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        showCancelButton,
        languageIndex,
      ];
}
