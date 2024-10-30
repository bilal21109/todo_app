import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final FirebaseAuth auth;
  ForgotPasswordCubit({required this.auth})
      : super(ForgotPasswordState.initial());

  Future<void> resetPassword(String email) async {
    try {
      emit(state.copyWith(status: ForgotPasswordStatus.sending));

      await auth.sendPasswordResetEmail(email: email);
      emit(state.copyWith(status: ForgotPasswordStatus.sent));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: ForgotPasswordStatus.error));
    }
    catch (e){
      emit(state.copyWith(status: ForgotPasswordStatus.error));
    }
  }
}
