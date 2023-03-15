import 'package:paynest_flutter_app/export.dart';

part 'register_detail_page_event.dart';
part 'register_detail_page_state.dart';

class RegisterDetailPageBloc
    extends Bloc<RegisterDetailPageEvent, RegisterDetailPageState> {
  RegisterDetailPageBloc({
    required this.registerDetailPageUseCase,
  }) : super(
          RegisterDetailPageState(),
        ) {
    on<SelectedFilter>(_selectedFilter);
    on<RegisterDetailPageLoading>(_loading);
    on<Init>(_init);
  }

  final RegisterDetailPageUseCase registerDetailPageUseCase;

  _selectedFilter(SelectedFilter event, emit) {
    emit(
      state.copyWith(
        selectedFilter: event.newValue,
      ),
    );
  }

  _loading(RegisterDetailPageLoading event, emit) {
    emit(
      state.copyWith(
        status: RegisterDetailPageStatus.loading,
      ),
    );
  }

  _init(Init event, emit) {
    emit(
      state.copyWith(
        selectedFilter: 'Male',
        isEmiratesSelected: true,
        isPassportSelected: true,
      ),
    );
  }
}
