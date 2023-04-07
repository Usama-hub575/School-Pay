part of 'host_bloc.dart';

// ignore: must_be_immutable
class HostState extends Equatable {
  HostStatus status;
  int pageIndex = 0;
  int payNow = 0;
  bool bottomTabIsActive = false;

  HostState({
    this.status = HostStatus.dashBoardPage,
    this.pageIndex = 0,
    this.bottomTabIsActive = false,
    this.payNow = 0,
  });

  HostState copyWith({
    HostStatus? status,
    int? pageIndex,
    int? payNow,
    bool? bottomTabIsActive,
  }) {
    return HostState(
      status: status ?? this.status,
      bottomTabIsActive: bottomTabIsActive ?? this.bottomTabIsActive,
      pageIndex: pageIndex ?? this.pageIndex,
      payNow: payNow ?? this.payNow,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pageIndex,
        payNow,
        bottomTabIsActive,
      ];
}
