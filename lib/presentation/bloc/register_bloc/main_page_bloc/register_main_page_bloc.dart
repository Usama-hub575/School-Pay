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
    on<Loaded>(_loaded);
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
        return Left(
          emit(
            state.copyWith(
              status: RegisterMainPageStatus.navigateToOTPPage,
            ),
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

  _loaded(Loaded event, emit) {
    emit(
      state.copyWith(
        status: RegisterMainPageStatus.loaded,
      ),
    );
  }

  _toggle(RegisterToggle event, emit) {
    if (event.toggleStatus == "password") {
      emit(
        state.copyWith(
          obscurePassword: !state.obscurePassword,
        ),
      );
    } else {
      emit(
        state.copyWith(
          obscureConfirmPassword: !state.obscureConfirmPassword,
        ),
      );
    }
  }

  _loading(RegisterMainPageLoading event, emit) {
    emit(
      state.copyWith(
        status: RegisterMainPageStatus.loading,
      ),
    );
  }
}
