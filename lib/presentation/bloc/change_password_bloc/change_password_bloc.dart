import 'package:paynest_flutter_app/export.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({
    required this.changePasswordUseCase,
  }) : super(
          ChangePasswordState(),
        ) {
    on<ChangePasswordToggle>(_toggle);
    on<ChangePasswordOnPressed>(_onPressed);
    on<ChangePasswordLoading>(_loading);
  }

  ChangePasswordUseCase changePasswordUseCase;

  _onPressed(ChangePasswordOnPressed event, emit) async {
    final response = await changePasswordUseCase.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
    );
    response.fold(
      (success) {
        if (success.status) {
          changePasswordUseCase.setString(
            key: StorageKeys.userPassword,
            value: event.newPassword,
          );
          emit(
            state.copyWith(
              status: ChangePasswordStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: ChangePasswordStatus.error,
              errorMessage: success.message,
            ),
          );
        }
      },
      (r) {
        emit(
          state.copyWith(
            status: ChangePasswordStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }

  _loading(ChangePasswordLoading event, emit) {
    emit(
      state.copyWith(
        status: ChangePasswordStatus.loading,
      ),
    );
  }

  _toggle(ChangePasswordToggle event, emit) {
    if (event.value == 'OldPassword') {
      emit(
        state.copyWith(
          oldPasswordObscure: !state.oldPasswordObscure,
        ),
      );
    } else if (event.value == 'NewPassword') {
      emit(
        state.copyWith(
          newPasswordObscure: !state.newPasswordObscure,
        ),
      );
    } else {
      emit(
        state.copyWith(
          confirmPasswordObscure: !state.confirmPasswordObscure,
        ),
      );
    }
  }
}
