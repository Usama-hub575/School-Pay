import 'package:paynest_flutter_app/export.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc({
    required this.resetPasswordUseCase,
  }) : super(
          ResetPasswordState(),
        ) {
    on<ResetPassword>(_resetPassword);
    on<ResetPasswordToggle>(_resetPasswordToggle);
    on<IsCodeComplete>(_isCodeComplete);
    on<ResetPasswordLoading>(_loading);
  }

  _loading(ResetPasswordLoading event, emit) {
    emit(
      state.copyWith(
        status: ResetPasswordStatus.loading,
      ),
    );
  }

  _isCodeComplete(IsCodeComplete event, emit) {
    emit(
      state.copyWith(
        isCodeComplete: event.isCodeComplete,
        otp: event.pin,
      ),
    );
  }

  _resetPasswordToggle(ResetPasswordToggle event, emit) {
    event.value == 'newPassword'
        ? emit(
            state.copyWith(
              newPasswordObscure: !state.newPasswordObscure,
            ),
          )
        : emit(
            state.copyWith(
              confirmPasswordObscure: !state.confirmPasswordObscure,
            ),
          );
  }

  _resetPassword(ResetPassword event, emit) async {
    final response = await resetPasswordUseCase.resetPassword(
      email: event.email,
      otp: event.otp,
      password: event.password,
    );
    return response.fold(
      (success) {
        success.message == 'passswordReset sucessfully'
            ? emit(
                state.copyWith(
                  status: ResetPasswordStatus.success,
                ),
              )
            : emit(
                state.copyWith(
                  status: ResetPasswordStatus.error,
                  errorMessage: success.message,
                ),
              );
      },
      (r) {
        emit(state.copyWith(
          status: ResetPasswordStatus.error,
          errorMessage: r.message,
        ));
      },
    );
  }
}
