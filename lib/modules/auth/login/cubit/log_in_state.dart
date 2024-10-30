part of 'log_in_cubit.dart';


enum AuthLogInStatus{ initial, loading, error, success, }

class LogInState {
  final AuthLogInStatus status;
  final String message;
  LogInState({required this.status,this.message=''});

  factory LogInState.initial() {
    return LogInState(status: AuthLogInStatus.initial);
  }


  LogInState copyWith({AuthLogInStatus? status,String? message}){
    return LogInState(status: status??this.status,message: message??'');
  }

}