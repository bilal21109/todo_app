part of 'app_cubit.dart';

enum AppAuthStatus{authenticated,unauthenticated}
class AppState {
  final bool isStarted;
  final AppAuthStatus status;

  AppState({required this.isStarted,required this.status});

  factory AppState.initial() {
    return AppState(isStarted: false,status: AppAuthStatus.unauthenticated);
  }

  AppState copyWith({bool? isStarted,AppAuthStatus? status}) {
    return AppState(isStarted: isStarted ?? this.isStarted,status: status??this.status);
  }
}
