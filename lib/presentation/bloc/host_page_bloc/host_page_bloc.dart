import 'package:paynest_flutter_app/export.dart';

part 'host_page_event.dart';
part 'host_page_state.dart';

class HostPageBloc extends Bloc<HostPageEvent, HostPageState> {
  HostPageBloc()
      : super(
          HostPageState(),
        ) {
    on<ChangePage>(_selectNavBarItem);
    on<FloatingActionButtonOnPressed>(_floatingActionButtonOnPressed);
  }

  _selectNavBarItem(ChangePage event, emit) {
    emit(
      state.copyWith(
        status: event.status,
      ),
    );
  }

  _floatingActionButtonOnPressed(FloatingActionButtonOnPressed event, emit) {
    emit(
      state.copyWith(
        payNow: -1,
        bottomTabIsActive: false,
      ),
    );
  }
}
