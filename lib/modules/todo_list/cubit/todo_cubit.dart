import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/todo_list/models/todo_model.dart';
import 'package:todo_app/modules/todo_list/repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;
  TodoCubit({required this.todoRepository}) : super(TodoState.initial());

  void getAllTodos({String? status,required DateTime selectedDate}) async {
    print('Getting todos');
    emit(state.copyWith(status: TodoStatus.loading));

    List<TodoModel> todos = await todoRepository.getAllTodos(status: status,selectedDate: selectedDate);
    emit(state.copyWith(status: TodoStatus.success, todos: todos));
  }

  void addTodo(TodoModel todo,DateTime selectedDate,[String? status]) async {
    emit(state.copyWith(status: TodoStatus.adding));
    todoRepository.addTodo(todo);
    List<TodoModel> todos = await todoRepository.getAllTodos(status: status,selectedDate: selectedDate);

    emit(state.copyWith(status: TodoStatus.success, todos: todos));
  }

  void updateTodoStatus(
    String id,
    TodoProgressStatus status,
  DateTime selectedDate,
    String currentStatus,
  ) async {
    emit(state.copyWith(status: TodoStatus.updating));
    await todoRepository.updateTodo(id, status);
    List<TodoModel> todos =
        await todoRepository.getAllTodos(status: currentStatus,selectedDate: selectedDate);

    emit(state.copyWith(status: TodoStatus.success, todos: todos));
  }

  void deleteTodo(String id, String currentStatus,DateTime selectedDate) async {
    emit(state.copyWith(status: TodoStatus.deleting));
    await todoRepository.deleteTodo(id);
    List<TodoModel> todos =
        await todoRepository.getAllTodos(status: currentStatus,selectedDate: selectedDate);
    emit(state.copyWith(status: TodoStatus.deleted));

    emit(state.copyWith(status: TodoStatus.success, todos: todos));
  }
}
