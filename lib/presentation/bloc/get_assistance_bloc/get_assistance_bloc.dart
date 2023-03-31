import 'package:paynest_flutter_app/export.dart';

part 'get_assistance_event.dart';
part 'get_assistance_state.dart';

class GetAssistanceBloc extends Bloc<GetAssistanceEvent, GetAssistanceState> {
  GetAssistanceBloc()
      : super(
          GetAssistanceState(),
        ) {
    on<OpenWhatsApp>(_openWhatsApp);
  }

  _openWhatsApp(OpenWhatsApp event, emit) async {
    var whatsapp = "+971525919430";
    var whatsappUrlAndroid = "whatsapp://send?phone=$whatsapp&text=hello";
    var whatAppUrlIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(
        Uri.parse(whatAppUrlIOS),
      )) {
        await launch(whatAppUrlIOS, forceSafariVC: false);
      } else {
        emit(
          state.copyWith(
            status: GetAssistanceStatus.showToast,
          ),
        );
      }
    } else {
      await launchUrl(
        Uri.parse(whatsappUrlAndroid),
      );
    }
  }
}
