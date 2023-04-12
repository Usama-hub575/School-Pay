part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileLoading extends EditProfileEvent {}

class EditProfileOnPressed extends EditProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String expiryDate;
  final String emiratesID;
  EditProfileOnPressed({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.expiryDate,
    required this.emiratesID,
  });
}
