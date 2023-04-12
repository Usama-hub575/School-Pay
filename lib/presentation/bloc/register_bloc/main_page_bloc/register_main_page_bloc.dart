import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

part 'register_main_page_event.dart';
part 'register_main_page_state.dart';

class RegisterMainPageBloc
    extends Bloc<RegisterMainPageEvent, RegisterMainPageState> {
  RegisterMainPageBloc({
    required this.registerMainPageUseCase,
  }) : super(
          RegisterMainPageState(),
        ) {
    on<CheckBox>(_checkBox);
    on<RegisterMainPageLoading>(_loading);
    on<RegisterToggle>(_toggle);
    on<SendOTP>(_sendOTP);
  }

  RegisterMainPageUseCase registerMainPageUseCase;

  _sendOTP(SendOTP event, emit) async {
    final response = await registerMainPageUseCase.hitSendOTP(
      event.email,
      event.userPhoneNumber,
      event.dialCode,
    );
    response.fold(
      (success) {
        success.status == true
            ? emit(
                state.copyWith(
                  status: RegisterMainPageStatus.navigateToOTPPage,
                  successMessage: success.message,
                ),
              )
            : emit(
                state.copyWith(
                  status: RegisterMainPageStatus.mainPageError,
                  mainPageErrorMessage: success.message,
                ),
              );
      },
      (r) {
        return Right(
          emit(
            state.copyWith(
              mainPageErrorMessage: r.message,
              status: RegisterMainPageStatus.mainPageError,
            ),
          ),
        );
      },
    );
  }

  _checkBox(CheckBox event, emit) {
    emit(
      state.copyWith(
        terms: !state.terms,
      ),
    );
  }

  _toggle(RegisterToggle event, emit) {
    event.toggleStatus == "password"
        ? emit(
            state.copyWith(
              obscurePassword: !state.obscurePassword,
            ),
          )
        : emit(
            state.copyWith(
              obscureConfirmPassword: !state.obscureConfirmPassword,
            ),
          );
  }

  _loading(RegisterMainPageLoading event, emit) {
    emit(
      state.copyWith(
        status: RegisterMainPageStatus.loading,
      ),
    );
  }
}
