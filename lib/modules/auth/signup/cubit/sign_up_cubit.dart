import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FirebaseAuth _auth;

  SignUpCubit({required FirebaseAuth auth})
      : _auth = auth,
        super(SignUpState.initial());

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      emit(state.copyWith(status: AuthSignUpStatus.loading));
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user);
      if (credential.user != null) {
        emit(state.copyWith(status: AuthSignUpStatus.success));
      } else {
        emit(state.copyWith(status: AuthSignUpStatus.error));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
