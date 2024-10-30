import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/app_keys.dart';
import 'package:todo_app/core/storage_services/storage_service.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final StorageService _service;
  final FirebaseAuth _auth;
  AppCubit({required StorageService storageService, required FirebaseAuth auth})
      : _service = storageService,
        _auth = auth,
        super(AppState.initial());

  checkAppStatus() {
    bool isStarted = _service.getBool(AppKeys.appStartKey);
    emit(state.copyWith(isStarted: isStarted));
  }

  setAppStarted(bool value) async {
    bool isStarted = await _service.setBool(AppKeys.appStartKey, value);
    emit(state.copyWith(isStarted: isStarted));
  }

  logout() async {
    try {
      await _auth.signOut();
      emit(state.copyWith(status: AppAuthStatus.unauthenticated));
    } catch (e) {}
  }

  checkAuthentication() {
    User? user = _auth.currentUser;
    if (user != null) {
      emit(state.copyWith(status: AppAuthStatus.authenticated));
    } else {
      emit(state.copyWith(status: AppAuthStatus.unauthenticated));
    }
  }
}
