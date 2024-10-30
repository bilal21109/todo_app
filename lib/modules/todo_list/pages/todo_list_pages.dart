import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/todo_list/cubit/tab_cubit.dart';
import 'package:todo_app/modules/todo_list/cubit/todo_cubit.dart';
import 'package:todo_app/modules/todo_list/models/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsState>(builder: (context, tabsState) {
      return SafeArea(
        child:
            BlocConsumer<TodoCubit, TodoState>(listener: (context, todoState) {
          if (todoState.status == TodoStatus.deleting) {}
          if (todoState.status == TodoStatus.deleted) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Deleted successfully!')));
          }
        }, builder: (context, todoState) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Today Tasks',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: [
                DateSelectionWidget(
                    onSelected: (date) {
                  context.read<TodoCubit>().getAllTodos(
                      status:
                          tabsState.tabs.firstWhere((e) => e.isSelected).status == 'all'?null:tabsState.tabs.firstWhere((e) => e.isSelected).status,
                      selectedDate: date);
                  setState(() {
                    _selectedDate = date;
                  });
                }),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      tabsState.tabs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          context.read<TabsCubit>().changeIndex(index);
                          context.read<TodoCubit>().getAllTodos(
                              status: index == 0
                                  ? null
                                  : tabsState.tabs[index].status,
                              selectedDate: _selectedDate);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: tabsState.tabs[index].isSelected
                                ? Colors.deepPurpleAccent
                                : Colors.grey,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Text(
                            tabsState.tabs[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: todoState.status == TodoStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : todoState.status == TodoStatus.failure
                          ? Center(
                              child: Text(todoState.message),
                            )
                          : todoState.todos.isEmpty
                              ? const Center(
                                  child: Text('No todo yet'),
                                )
                              : ListView.builder(
                                  itemCount: todoState.todos.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    TodoModel todo = todoState.todos[index];

                                    return Dismissible(
                                      key:
                                          Key(todo.id.toString()), // Unique key
                                      direction: DismissDirection
                                          .startToEnd, // Swipe left to right
                                      background: Container(
                                        color: Colors.red,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        setState(() {
                                          todoState.todos.removeAt(index);
                                        });
                                        context.read<TodoCubit>().deleteTodo(
                                            todo.id!,
                                            tabsState.tabs
                                                .firstWhere((element) =>
                                                    element.isSelected)
                                                .status,
                                            _selectedDate);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .deepPurpleAccent, // Red background
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Task Name and Description
                                            Text(
                                              todo.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              todo.description,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.timer_sharp),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(DateFormat('hh:mm a')
                                                        .format(todo.time)),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<TodoCubit>()
                                                        .updateTodoStatus(
                                                            todo.id!,
                                                            todo.status ==
                                                                    TodoProgressStatus
                                                                        .pending
                                                                ? TodoProgressStatus
                                                                    .inProgress
                                                                : todo.status ==
                                                                        TodoProgressStatus
                                                                            .inProgress
                                                                    ? TodoProgressStatus
                                                                        .complete
                                                                    : TodoProgressStatus
                                                                        .pending,
                                                            _selectedDate,
                                                            tabsState.tabs
                                                                .firstWhere(
                                                                    (element) =>
                                                                        element
                                                                            .isSelected)
                                                                .status);
                                                  },
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      todo.status.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}

class DateSelectionWidget extends StatelessWidget {
  final Function(DateTime) onSelected;
  const DateSelectionWidget({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: DatePicker(
        DateTime.now(),
        height: 100.0,
        width: 70,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.deepPurpleAccent,

        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        dayTextStyle: TextStyle(
          fontSize: 10.0,
          color: Colors.grey,
        ),
        monthTextStyle: TextStyle(
          fontSize: 10.0,
          color: Colors.grey,
        ),
        // deactivatedColor: Colors.white,

        onDateChange: onSelected,
      ),
    );
  }
}
