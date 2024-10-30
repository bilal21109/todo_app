part of 'todo_cubit.dart';

enum TodoStatus { initial, loading, adding, updating,deleting,deleted, success, failure }

class TodoState {
  final TodoStatus status;
  final List<TodoModel> todos;
  final String message;

  TodoState({required this.status, required this.todos, this.message = ''});

  static TodoState initial() {
    return TodoState(status: TodoStatus.initial, todos: []
    );
  }

  TodoState copyWith(
      {TodoStatus? status, List<TodoModel>? todos, String? message}) {
    return TodoState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        message: message ?? '');
  }
}
