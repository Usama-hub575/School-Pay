part of 'get_assistance_bloc.dart';

abstract class GetAssistanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OpenWhatsApp extends GetAssistanceEvent {}
