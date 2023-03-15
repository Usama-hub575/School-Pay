part of 'register_main_page_bloc.dart';

class RegisterMainPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckBox extends RegisterMainPageEvent {}

class RegisterMainPageLoading extends RegisterMainPageEvent {}

class RegisterToggle extends RegisterMainPageEvent {
  final String toggleStatus;

  RegisterToggle({
    required this.toggleStatus,
  });
}

class Loaded extends RegisterMainPageEvent {}
