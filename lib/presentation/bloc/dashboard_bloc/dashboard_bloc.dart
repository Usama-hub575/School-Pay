import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/presentation/bloc/dashboard_bloc/dashboard_enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.dashboardUseCase,
  }) : super(
          DashboardState(),
        ) {
    // on<>();
  }
  DashboardUseCase dashboardUseCase;
}
