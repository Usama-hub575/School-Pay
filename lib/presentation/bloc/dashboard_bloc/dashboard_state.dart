part of 'dashboard_bloc.dart';

// ignore: must_be_immutable
class DashboardState extends Equatable {
  DashboardStatus status = DashboardStatus.init;

  DashboardState({
    this.status = DashboardStatus.init,
  });

  DashboardState copyWith({
    DashboardStatus? status,
  }) {
    return DashboardState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
