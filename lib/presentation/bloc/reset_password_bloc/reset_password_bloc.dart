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
  }

  _resetPasswordToggle(ResetPasswordToggle event, emit) {
    emit(state.copyWith(
      isObscure: !state.isObscure,
    ));
  }

  _resetPassword(ResetPassword event, emit) async {
    final response = await resetPasswordUseCase.resetPassword(
      email: email,
      otp: otp,
      password: password,
    );
    return response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: ResetPasswordStatus.navigateToSignInPage,
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
