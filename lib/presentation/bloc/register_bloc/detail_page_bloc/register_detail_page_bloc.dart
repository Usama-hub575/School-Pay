import 'package:dartz/dartz.dart';
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
    on<Register>(_register);
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

  _register(Register event, emit) async {
    final response = await registerDetailPageUseCase.register(
      firstName: event.firstName,
      lastName: event.lastName,
      password: event.password,
      email: event.email,
      countryCode: state.countryCode,
      dialCode: event.dialCode,
      phone: event.phone,
      emiratesId: event.emiratesID,
      birth: event.birth,
      passport: event.passport,
      gender: state.selectedFilter,
    );
    return response.fold(
      (success) {
        return Left(
          success.status
              ? emit(
                  state.copyWith(
                    status: RegisterDetailPageStatus.navigateToDashboard,
                  ),
                )
              : emit(
                  state.copyWith(
                    status: RegisterDetailPageStatus.detailPageError,
                    errorMessage: success.message,
                  ),
                ),
        );
      },
      (r) {
        return Right(
          emit(
            state.copyWith(
              status: RegisterDetailPageStatus.detailPageError,
              errorMessage: r.message,
            ),
          ),
        );
      },
    );
  }
}
