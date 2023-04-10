part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePasswordToggle extends ChangePasswordEvent {
  final String value;

  ChangePasswordToggle({
    required this.value,
  });
}

class ChangePasswordLoading extends ChangePasswordEvent {}

class ChangePasswordOnPressed extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;

  ChangePasswordOnPressed({
    required this.oldPassword,
    required this.newPassword,
  });
}
