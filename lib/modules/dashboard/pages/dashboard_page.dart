import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/modules/home/pages/home_page.dart';
import 'package:todo_app/modules/profile/pages/profile_page.dart';
import 'package:todo_app/modules/todo_list/cubit/todo_cubit.dart';
import 'package:todo_app/modules/unknown/pages/unknown_page.dart';

import '../../todo_list/pages/add_todo_page.dart';
import '../../todo_list/pages/todo_list_pages.dart';
import '../cubit/navbar_cubit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<TodoCubit>().getAllTodos(selectedDate: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) =>  AddTodoPage()));
            },
            child: const Icon(Icons.add),
          ),          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                state.items.length,
                (index) => Expanded(
                  child:index == 2?const SizedBox.shrink(): IconButton(
                    onPressed: () {
                      context.read<NavbarCubit>().changeIndex(index);
                    },
                    icon: SvgPicture.asset(
                      state.items[index].icon,
                      colorFilter: ColorFilter.mode(
                        state.items[index].isSelected
                            ? Colors.blue
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: _getPage(state.items.indexOf(
              state.items.firstWhere((element) => element.isSelected))),
        );
      },
    );
  }

  Widget _getPage(int index) {
    Widget widget = const SizedBox.shrink();
    widget = switch (index) {
      0 => const HomePage(),
      1 => const TodoListPage(),
      2 => const SizedBox.shrink(),
      3 => const UnknownPage(),
      4 => const ProfilePage(),
      _ => const SizedBox.shrink(),
    };
    return widget;
  }
}
