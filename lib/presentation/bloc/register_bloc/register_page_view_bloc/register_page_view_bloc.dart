import 'package:paynest_flutter_app/export.dart';

part 'register_page_view_event.dart';
part 'register_page_view_state.dart';

class RegisterPageViewBloc
    extends Bloc<RegisterPageViewEvent, RegisterPageViewState> {
  RegisterPageViewBloc()
      : super(
          RegisterPageViewState(),
        ) {
    on<BackNavigation>(_backNavigation);
    on<ChangeStep>(_changeStep);
  }

  _backNavigation(BackNavigation event, emit) {
    if (state.currentIndex == 1 || state.currentIndex == 2) {
      emit(
        state.copyWith(
          status: RegisterPageViewStatus.jumpToMainPage,
          currentIndex: 0,
        ),
      );
    } else if (state.currentIndex == 0) {
      emit(
        state.copyWith(
          status: RegisterPageViewStatus.jumpToPreviousPage,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RegisterPageViewStatus.pop,
        ),
      );
    }
  }

  _changeStep(ChangeStep event, emit) {
    emit(state.copyWith(
      currentIndex: event.currentIndex,
    ));
  }
}
