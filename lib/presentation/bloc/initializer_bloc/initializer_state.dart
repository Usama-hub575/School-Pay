
part of 'initializer_bloc.dart';

class InitializerState extends Equatable {
  InitializerStatus status = InitializerStatus.loading;

  InitializerState({
    this.status = InitializerStatus.loading,
  });

  InitializerState copyWith({
    InitializerStatus? status,
  }) {
    return InitializerState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
