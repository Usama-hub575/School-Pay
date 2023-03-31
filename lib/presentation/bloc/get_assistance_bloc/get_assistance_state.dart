part of 'get_assistance_bloc.dart';

// ignore: must_be_immutable
class GetAssistanceState extends Equatable {
  GetAssistanceStatus status;

  GetAssistanceState({
    this.status = GetAssistanceStatus.init,
  });

  GetAssistanceState copyWith({
    GetAssistanceStatus? status,
  }) {
    return GetAssistanceState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
