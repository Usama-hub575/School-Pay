part of 'register_detail_page_bloc.dart';

abstract class RegisterDetailPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectedFilter extends RegisterDetailPageEvent {
  final String newValue;

  SelectedFilter({
    required this.newValue,
  });
}

class RegisterDetailPageLoading extends RegisterDetailPageEvent {}

class Init extends RegisterDetailPageEvent {}
