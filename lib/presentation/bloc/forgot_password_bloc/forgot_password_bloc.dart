import 'package:paynest_flutter_app/export.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordBloc({
    required this.forgotPasswordUseCase,
  }) : super(
          ForgotPasswordState(),
        ) {
    on<HitForgotPassword>(_hitForgotPassword);
    on<ForgotPasswordLoading>(_loading);
  }

  _loading(ForgotPasswordLoading event, emit) {
    emit(
      state.copyWith(
        status: ForgotPasswordStatus.loading,
      ),
    );
  }

  _hitForgotPassword(HitForgotPassword event, emit) async {
    final response = await forgotPasswordUseCase.forgotPassword(event.email);
    response.fold(
      (success) {
        success.status
            ? emit(
                state.copyWith(
                  status: ForgotPasswordStatus.navigateToNewPassword,
                ),
              )
            : emit(
                state.copyWith(
                  status: ForgotPasswordStatus.error,
                  errorMessage: success.message,
                ),
              );
      },
      (r) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.error,
            errorMessage: r.message,
          ),
        );
      },
    );
  }
}
