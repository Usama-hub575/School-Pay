part of 'firebase_bloc.dart';

// ignore: must_be_immutable
class FirebaseState extends Equatable {
  FirebaseStatus firebaseStatus;

  FirebaseState({
    this.firebaseStatus = FirebaseStatus.init,
  });

  FirebaseState copyWith({required FirebaseStatus status}) {
    return FirebaseState(firebaseStatus: status);
  }

  @override
  List<Object?> get props => [
        firebaseStatus,
      ];
}
