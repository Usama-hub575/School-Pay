part of 'pay_now_bloc.dart';

abstract class PayNowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PayNowOnPressed extends PayNowEvent {}

class StudentCardOnTap extends PayNowEvent {
  final String payAbleAmount;
  final StudentData studentData;
  StudentCardOnTap({
    required this.payAbleAmount,
    required this.studentData,
  });
}
