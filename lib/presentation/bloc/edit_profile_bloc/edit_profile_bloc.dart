import 'package:paynest_flutter_app/export.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    required this.editProfileUseCase,
  }) : super(
          EditProfileState(),
        ) {
    on<EditProfileLoading>(_loading);
    on<EditProfileLoaded>(_loaded);
    on<EditProfileOnPressed>(_onPressed);
    on<GetName>(_getName);
  }

  EditProfileUseCase editProfileUseCase;

  _getName(GetName event, emit) async {
    emit(
      state.copyWith(
        firstName: editProfileUseCase.getString(
          key: StorageKeys.firstName,
        ),
        lastName: editProfileUseCase.getString(
          key: StorageKeys.lastName,
        ),
      ),
    );
  }

  _onPressed(EditProfileOnPressed event, emit) async {
    final response = await editProfileUseCase.updateProfile(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      expiryDate: event.expiryDate,
      emiratesID: event.emiratesID,
    );
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: EditProfileStatus.success,
                  successMessage: success.message,
                ),
              )
            : emit(
                state.copyWith(
                  status: EditProfileStatus.error,
                  errorMessage: success.message,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: EditProfileStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _loading(EditProfileLoading event, emit) {
    emit(
      state.copyWith(
        status: EditProfileStatus.loading,
      ),
    );
  }

  _loaded(EditProfileLoaded event, emit) {
    emit(
      state.copyWith(
        status: EditProfileStatus.loaded,
      ),
    );
  }
}
