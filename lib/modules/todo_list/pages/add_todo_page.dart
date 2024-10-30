import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/modules/todo_list/cubit/tab_cubit.dart';
import 'package:todo_app/modules/todo_list/cubit/todo_cubit.dart';
import 'package:todo_app/modules/todo_list/models/todo_model.dart';

import '../models/tab_model.dart';
import '../widgets/custom_textfield_widget.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({
    super.key,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add Todo'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            CustomTextFieldWidget(
              controller: _nameController,
              hintText: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFieldWidget(
              controller: _descriptionController,
              hintText: 'Description',
              maxLines: 6,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFieldWidget(
              controller: _dateController,
              prefixIcon: Icons.calendar_month,
              suffixIcon: Icons.arrow_drop_down,
              hintText: 'Select date',
              readOnly: true,
              onTap: () async {
                date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030));
                _dateController.text =
                    DateFormat('dd-MM-yyyy').format(date ?? DateTime.now());
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFieldWidget(
              controller: _timeController,
              prefixIcon: Icons.calendar_month,
              suffixIcon: Icons.arrow_drop_down,
              hintText: 'Select time',
              readOnly: true,
              onTap: () async {
                time = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                DateTime now = DateTime.now();

                if (time != null) {
                  DateTime dateTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    time!.hour,
                    time!.minute,
                  );
                  _timeController.text = DateFormat('hh:mm a').format(dateTime);
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocListener<TodoCubit, TodoState>(
              listener: (context, state) {
                if (state.status == TodoStatus.adding) {
                  print('It is adding todo');
                }

                if (state.status == TodoStatus.success) {
                  Navigator.pop(context);
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Add title')));
                      return;
                    }
                    if (_descriptionController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Add description')));
                      return;
                    }
                    if (date == null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Select date')));
                      return;
                    }
                    if (time == null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Select time')));
                      return;
                    }

                    DateTime dateTime = DateTime(
                      date!.year,
                      date!.month,
                      date!.day,
                      time!.hour,
                      time!.minute,
                    );
                    TabModel tab = context
                        .read<TabsCubit>()
                        .state
                        .tabs
                        .firstWhere((element) => element.isSelected);
                    TodoModel todo = TodoModel(
                        name: _nameController.text,
                        date: date!,
                        time: dateTime,
                        description: _descriptionController.text);
                    context.read<TodoCubit>().addTodo(todo, DateTime.now(),
                        tab.status == 'all' ? null : tab.status);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.deepPurple),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
