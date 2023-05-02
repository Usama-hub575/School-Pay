part of 'edit_profile_bloc.dart';

// ignore: must_be_immutable
class EditProfileState extends Equatable {
  EditProfileStatus status = EditProfileStatus.init;
  String errorMessage = '';
  String successMessage = '';
  String lastName = '';
  String firstName = '';

  EditProfileState({
    this.status = EditProfileStatus.init,
    this.errorMessage = '',
    this.successMessage = '',
    this.firstName = '',
    this.lastName = '',
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    String? errorMessage,
    String? successMessage,
    String? firstName,
    String? lastName,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        successMessage,
        firstName,
        lastName,
      ];
}
