import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynest_flutter_app/data/storage/storage_repo_impl.dart';
import 'package:paynest_flutter_app/domain/use_cases/firebase_use_case/firebase_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_status.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc({
    required this.firebaseUseCase,
  }) : super(const FirebaseState()) {
    on<InitializeFirebaseRemoteConfiguration>(_initializeFirebaseRemoteConfig);
  }

  final FirebaseUseCase firebaseUseCase;

  Future<void> _initializeFirebaseRemoteConfig(
    InitializeFirebaseRemoteConfiguration event,
    emit,
  ) async {
    bool value = await firebaseUseCase.initializeRemoteConfig();
    if (value) {
      emit(
        state.copyWith(
          status: FirebaseStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FirebaseStatus.failure,
        ),
      );
    }
    var messaging = FirebaseMessaging.instance;
    final fcmToken = StorageRepoImpl(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
    messaging.getToken().then(
      (value) {
        fcmToken.saveString(
          key: 'fcmToken',
          value: value,
        );
        if (kDebugMode) {
          print(
            fcmToken.getString(
              key: 'fcmToken',
            ),
          );
        }
      },
    );
  }
}
