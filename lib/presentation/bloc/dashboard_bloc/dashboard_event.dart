part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStudents extends DashboardEvent {}

class FetchTransactions extends DashboardEvent {}

class GetStudentByID extends DashboardEvent {
  final String userID;

  GetStudentByID({
    required this.userID,
  });
}

// class GetName extends DashboardEvent {}

class ShowShimmer extends DashboardEvent {}

class ResetSelectedCard extends DashboardEvent {}

class PayNowOnSearchChange extends DashboardEvent {
  final String value;

  PayNowOnSearchChange({
    required this.value,
  });
}

class UpdatedSelectedCard extends DashboardEvent {
  final int id;

  UpdatedSelectedCard({
    required this.id,
  });
}

class IsBioMetricEnable extends DashboardEvent {}

class RadioButtonOnTap extends DashboardEvent {
  final bool value;

  RadioButtonOnTap({
    required this.value,
  });
}
