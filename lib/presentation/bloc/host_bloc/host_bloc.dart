import 'package:paynest_flutter_app/export.dart';

part 'host_event.dart';
part 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc()
      : super(
          HostState(),
        ) {
    on<SelectNavigationBarItem>(_selectNavigationBarItem);
    on<FloatingActionButtonOnPressed>(_floatingActionButtonOnPressed);
    on<ChangePageIndex>(_changePageIndex);
  }

  _changePageIndex(ChangePageIndex event, emit) {
    emit(
      state.copyWith(
        pageIndex: event.pageIndex,
      ),
    );
    if (event.pageIndex == 0) {
      emit(
        state.copyWith(
          status: HostStatus.dashBoardPage,
        ),
      );
    } else if (event.pageIndex == 1) {
      emit(
        state.copyWith(
          status: HostStatus.studentPage,
        ),
      );
    } else if (event.pageIndex == 2) {
      emit(
        state.copyWith(
          status: HostStatus.recentTransactionPage,
        ),
      );
    } else if (event.pageIndex == 3) {
      emit(
        state.copyWith(
          status: HostStatus.settingsPage,
        ),
      );
    }
  }

  _selectNavigationBarItem(SelectNavigationBarItem event, emit) {
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
