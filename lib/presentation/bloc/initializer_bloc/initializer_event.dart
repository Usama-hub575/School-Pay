part of 'initializer_bloc.dart';

abstract class InitializerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateButtonAction extends InitializerEvent {}

class GetCountries extends InitializerEvent {}

class Initialize extends InitializerEvent {}
