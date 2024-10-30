part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus{initial, sending,sent, error}
class ForgotPasswordState {
  final ForgotPasswordStatus status;

  ForgotPasswordState({required this.status});

  factory ForgotPasswordState.initial(){
    return ForgotPasswordState(status:ForgotPasswordStatus.initial);
  }

  ForgotPasswordState copyWith({ForgotPasswordStatus?status}){
    return ForgotPasswordState(status:status??this.status);
  }
}
