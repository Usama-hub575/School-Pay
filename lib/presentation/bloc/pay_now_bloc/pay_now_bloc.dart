import 'package:paynest_flutter_app/export.dart';

part 'pay_now_event.dart';
part 'pay_now_state.dart';

class PayNowBloc extends Bloc<PayNowEvent, PayNowState> {
  final PayNowPageUseCase payNowPageUseCase;

  PayNowBloc({
    required this.payNowPageUseCase,
  }) : super(
          PayNowState(
            studentData: StudentData.empty(),
          ),
        ) {
    on<PayNowOnPressed>(_onPressed);
    on<StudentCardOnTap>(_studentCardOnTap);
  }

  _onPressed(PayNowOnPressed event, emit) {}

  _studentCardOnTap(StudentCardOnTap event, emit) {
    emit(
      state.copyWith(
        payAbleAmount: event.payAbleAmount,
        studentData: event.studentData,
      ),
    );
  }
}
