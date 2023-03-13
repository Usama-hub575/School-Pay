import 'package:paynest_flutter_app/export.dart';

part 'register_main_page_event.dart';
part 'register_main_page_state.dart';

class RegisterMainPageBloc
    extends Bloc<RegisterMainPageBaseEvent, RegisterMainPageBaseState> {
  RegisterMainPageBloc({
    required this.registerMainPageUseCase,
  }) : super(
          RegisterMainPageBaseState(),
        ) {
    on<CheckBox>(_checkBox);
    on<RegisterLoading>(_loading);
    on<RegisterToggle>(_toggle);
  }

  final RegisterMainPageUseCase registerMainPageUseCase;

  _checkBox(CheckBox event, emit) {
    emit(
      state.copyWith(
        terms: !state.terms,
      ),
    );
  }

  _toggle(RegisterToggle event, emit) {
    emit(
      state.copyWith(
        isObscure: !state.isObscure,
        status: event.toggleStatus,
      ),
    );
    // emit(
    //   state.copyWith(
    //     isObscure: !state.isObscure,
    //     status: RegisterMainPageStatus.password,
    //   ),
    // );
  }

  _loading(RegisterLoading event, emit) {
    emit(
      state.copyWith(
        loading: !state.loading,
      ),
    );
  }
}
