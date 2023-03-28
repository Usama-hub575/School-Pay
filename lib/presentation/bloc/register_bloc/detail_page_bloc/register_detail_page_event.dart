part of 'register_detail_page_bloc.dart';

abstract class RegisterDetailPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectedFilter extends RegisterDetailPageEvent {
  final String newValue;

  SelectedFilter({
    required this.newValue,
  });
}

class RegisterDetailPageLoading extends RegisterDetailPageEvent {}

class Init extends RegisterDetailPageEvent {}

class Register extends RegisterDetailPageEvent {
  final dynamic firstName;
  final dynamic lastName;
  final dynamic password;
  final dynamic email;
  final dynamic dialCode;
  final dynamic phone;
  final dynamic birth;
  final dynamic passport;
  final dynamic emiratesID;

  Register({
    required this.passport,
    required this.firstName,
    required this.dialCode,
    required this.password,
    required this.email,
    required this.lastName,
    required this.birth,
    required this.emiratesID,
    required this.phone,
  });
}
