import 'package:paynest_flutter_app/export.dart';

part 'register_otp_page_event.dart';
part 'register_otp_page_state.dart';

class RegisterOTPPageBloc
    extends Bloc<RegisterOTPPageBaseEvent, RegisterOTPPageState> {
  RegisterOTPPageBloc({
    required this.registerOTPPageUseCase,
  }) : super(
          RegisterOTPPageState(),
        ) {
    // on<>();
  }

  final RegisterOTPPageUseCase registerOTPPageUseCase;
}
