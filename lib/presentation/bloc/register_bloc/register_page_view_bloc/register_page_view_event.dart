part of 'register_page_view_bloc.dart';

abstract class RegisterPageViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BackNavigation extends RegisterPageViewEvent {}

class ChangeStep extends RegisterPageViewEvent {
  final int currentIndex;

  ChangeStep({
    required this.currentIndex,
  });
}
