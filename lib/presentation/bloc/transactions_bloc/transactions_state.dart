part of 'transactions_bloc.dart';

// ignore: must_be_immutable
class TransactionState extends Equatable {
  TransactionStatus status = TransactionStatus.init;
  bool shimmerValue = true;

  TransactionState({
    this.status = TransactionStatus.init,
    this.shimmerValue = true,
  });

  TransactionState copyWith({
    TransactionStatus? status,
    bool? shimmerValue,
  }) {
    return TransactionState(
      status: status ?? this.status,
      shimmerValue: shimmerValue ?? this.shimmerValue,
    );
  }

  @override
  List<Object?> get props => [
        status,
        shimmerValue,
      ];
}
