part of 'register_detail_page_bloc.dart';

class RegisterDetailPageBaseState extends Equatable {
  final RegisterDetailPageStatus status;

  RegisterDetailPageBaseState({
    this.status = RegisterDetailPageStatus.init,
  });

  RegisterDetailPageBaseState copyWith({
    RegisterDetailPageStatus? status,
  }) {
    return RegisterDetailPageBaseState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
