import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final FirebaseAuth _auth;

  LogInCubit({required FirebaseAuth auth})
      : _auth = auth,
        super(LogInState.initial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    print(email);
    print(password);
    try {
      emit(state.copyWith(status: AuthLogInStatus.loading));
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user);
      if (credential.user != null) {
        emit(state.copyWith(status: AuthLogInStatus.success));
      } else {
        emit(state.copyWith(status: AuthLogInStatus.error));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Week Password') {
        emit(state.copyWith(status: AuthLogInStatus.error,message: e.code));
      } else if (e.code == 'This Email is used in') {
        emit(state.copyWith(status: AuthLogInStatus.error,message: e.code));
      }
      emit(state.copyWith(status: AuthLogInStatus.error,message: e.code));

    } catch (e) {
      emit(state.copyWith(status: AuthLogInStatus.error,message: e.toString()));
    }
  }
}
