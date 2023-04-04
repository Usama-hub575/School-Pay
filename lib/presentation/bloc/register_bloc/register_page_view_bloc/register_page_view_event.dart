part of 'register_page_view_bloc.dart';

abstract class RegisterPageViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BackNavigation extends RegisterPageViewEvent {}

class EnableButton extends RegisterPageViewEvent {
  final bool enableButton;

  EnableButton({
    required this.enableButton,
  });
}

class ChangeStep extends RegisterPageViewEvent {
  final int currentIndex;

  ChangeStep({
    required this.currentIndex,
  });
}
