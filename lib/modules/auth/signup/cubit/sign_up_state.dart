part of 'sign_up_cubit.dart';

enum AuthSignUpStatus{ initial, loading, error, success }

class SignUpState {
  final AuthSignUpStatus status;

  SignUpState({required this.status});

  factory SignUpState.initial() {
    return SignUpState(status: AuthSignUpStatus.initial);
  }


  SignUpState copyWith({AuthSignUpStatus? status}){
   return SignUpState(status: status??this.status);
  }

}
