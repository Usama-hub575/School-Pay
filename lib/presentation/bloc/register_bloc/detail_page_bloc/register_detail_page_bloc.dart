import 'package:paynest_flutter_app/export.dart';

part 'register_detail_page_event.dart';
part 'register_detail_page_state.dart';

class RegisterDetailPageBloc
    extends Bloc<RegisterDetailPageBaseEvent, RegisterDetailPageBaseState> {
  RegisterDetailPageBloc({
    required this.registerDetailPageUseCase,
  }) : super(
          RegisterDetailPageBaseState(),
        ) {
    // on<>();
  }

  final RegisterDetailPageUseCase registerDetailPageUseCase;
}
