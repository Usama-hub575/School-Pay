part of 'host_bloc.dart';

abstract class HostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectNavigationBarItem extends HostEvent {
  final HostStatus status;

  SelectNavigationBarItem({
    required this.status,
  });
}

class ChangePageIndex extends HostEvent {
  final int pageIndex;

  ChangePageIndex({
    required this.pageIndex,
  });
}

class FloatingActionButtonOnPressed extends HostEvent {}
