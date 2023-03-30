part of 'host_page_bloc.dart';

abstract class HostPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePage extends HostPageEvent {
  final HostPageStatus status;

  ChangePage({
    required this.status,
  });
}

class FloatingActionButtonOnPressed extends HostPageEvent {}
