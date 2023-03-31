part of 'host_page_bloc.dart';

// ignore: must_be_immutable
class HostPageState extends Equatable {
  HostPageStatus status;
  int pageIndex = 0;
  int payNow = 0;
  bool bottomTabIsActive = false;

  HostPageState({
    this.status = HostPageStatus.dashBoardPage,
    this.pageIndex = 0,
    this.bottomTabIsActive = false,
    this.payNow = 0,
  });

  HostPageState copyWith({
    HostPageStatus? status,
    int? pageIndex,
    int? payNow,
    bool? bottomTabIsActive,
  }) {
    return HostPageState(
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
