part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStudents extends DashboardEvent {}

class FetchTransactions extends DashboardEvent {}

class GetName extends DashboardEvent {}

class ShowShimmer extends DashboardEvent {}

class IsBioMetricEnable extends DashboardEvent {}

class RadioButtonOnTap extends DashboardEvent {
  final bool value;

  RadioButtonOnTap({
    required this.value,
  });
}
