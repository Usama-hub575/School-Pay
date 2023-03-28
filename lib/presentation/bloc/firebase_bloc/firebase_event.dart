part of 'firebase_bloc.dart';

abstract class FirebaseEvent extends Equatable {
  const FirebaseEvent();

  @override
  List<Object?> get props => [];
}

class InitializeFirebaseRemoteConfiguration extends FirebaseEvent {}
