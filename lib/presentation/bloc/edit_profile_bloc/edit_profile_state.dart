part of 'edit_profile_bloc.dart';

// ignore: must_be_immutable
class EditProfileState extends Equatable {
  EditProfileStatus status = EditProfileStatus.init;
  String errorMessage = '';
  String successMessage = '';

  EditProfileState({
    this.status = EditProfileStatus.init,
    this.errorMessage = '',
    this.successMessage = '',
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        successMessage,
      ];
}
