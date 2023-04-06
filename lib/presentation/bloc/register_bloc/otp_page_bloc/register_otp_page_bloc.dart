import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

part 'register_otp_page_event.dart';
part 'register_otp_page_state.dart';

class RegisterOTPPageBloc
    extends Bloc<RegisterOTPPageEvent, RegisterOTPPageState> {
  RegisterOTPPageBloc({
    required this.registerOTPPageUseCase,
  }) : super(RegisterOTPPageState()) {
    on<CheckCode>(_code);
    on<VerifyOTP>(_verifyOTP);
    on<StartTimer>(_startTimer);
    on<OTPLoading>(_loading);
  }

  final RegisterOTPPageUseCase registerOTPPageUseCase;

  _code(CheckCode event, emit) {
    emit(
      state.copyWith(
        isCodeComplete: event.isCodeComplete,
      ),
    );
  }

  _startTimer(StartTimer event, Emitter<RegisterOTPPageState> emit) {
    Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (Timer timer) {
        if (state.start < 2) {
          emit(
            state.copyWith(
              timeUpFlag: true,
            ),
          );
          timer.cancel();
        } else {
          emit(
            state.copyWith(
              start: state.start--,
            ),
          );
        }
      },
    );
  }

  _loading(OTPLoading event, emit) {
    emit(
      state.copyWith(
        status: RegisterOTPPageStatus.loading,
      ),
    );
  }

  _verifyOTP(VerifyOTP event, emit) async {
    final response = await registerOTPPageUseCase.verifyOTP(
      event.phoneNumber,
      event.otpCode,
    );
    return response.fold(
      (success) {
        return Left(
          success.type == 'success'
              ? emit(
                  state.copyWith(
                    status: RegisterOTPPageStatus.navigateToDetailPage,
                    isCodeComplete: false,
                  ),
                )
              : emit(
                  state.copyWith(
                    status: RegisterOTPPageStatus.navigateToDetailPage,
                    isCodeComplete: false,
                    otpErrorMessage: success.message,
                  ),
                ),
        );
      },
      (r) {
        return Right(
          emit(
            state.copyWith(
              otpErrorMessage: r.message,
              status: RegisterOTPPageStatus.otpPageError,
            ),
          ),
        );
      },
    );
  }
}
