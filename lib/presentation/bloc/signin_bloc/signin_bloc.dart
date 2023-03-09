import 'package:paynest_flutter_app/export.dart';

part 'signin_events.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.signInUseCase,
  }) : super(
          SignInState(),
        ) {
    on<OnPressed>(_onPressed);
    on<BioMetric>(_bioMetric);
    on<Initializer>(_initialize);
    on<Toggle>(_toggle);
    on<Loading>(_loading);
    on<ForgotPassword>(_forgotPassword);
  }

  final SignInUseCase signInUseCase;

  _forgotPassword(ForgotPassword event, emit) {
    emit(
      state.copyWith(
        status: SignInStatus.forgotPassword,
      ),
    );
  }

  _loading(Loading event, emit) {
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
  }

  _initialize(Initializer event, emit) {
    state.copyWith(
      isBioMetric: signInUseCase.isBioMetricEnable(),
    );
  }

  _onPressed(OnPressed event, emit) async {
    final response = await signInUseCase.onPressed(
        email: event.email, password: event.password);
    if (response.status) {
      emit(
        state.copyWith(
          status: SignInStatus.home,
        ),
      );
    } else {
      state.message = response.message.toString();
      emit(
        state.copyWith(
          status: SignInStatus.showToast,
        ),
      );
    }
  }

  _toggle(Toggle event, emit) {
    emit(
      state.copyWith(
        isObscure: !state.isObscure,
        status: SignInStatus.toggle,
      ),
    );
  }

  _bioMetric(BioMetric event, emit) async {
    state.copyWith(
      message: await signInUseCase.bioMetricOnTap(),
    );
    if (state.message == home) {
      emit(
        state.copyWith(
          status: SignInStatus.home,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: SignInStatus.showToast,
        ),
      );
    }
  }
}
