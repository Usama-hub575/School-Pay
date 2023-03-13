part of 'register_main_page_bloc.dart';

class RegisterMainPageBaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckBox extends RegisterMainPageBaseEvent {}

class RegisterLoading extends RegisterMainPageBaseEvent {}

class RegisterToggle extends RegisterMainPageBaseEvent {
  final RegisterMainPageStatus toggleStatus;
  RegisterToggle({
    required this.toggleStatus,
  });
}
