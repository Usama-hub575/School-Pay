part of 'firebase_bloc.dart';

class FirebaseState extends Equatable {
  final FirebaseStatus firebaseStatus;

  const FirebaseState({
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
