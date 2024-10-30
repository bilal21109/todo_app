import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/app/cubit/app_cubit.dart';
import 'package:todo_app/modules/auth/login/pages/login_page.dart';
import 'package:todo_app/modules/dashboard/pages/dashboard_page.dart';

import '../../../core/injection/di.dart';
import '../../dashboard/cubit/navbar_cubit.dart';
import '../../todo_list/cubit/tab_cubit.dart';
import '../../todo_list/cubit/todo_cubit.dart';
import 'get_started_page.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(storageService: di(), auth: di())..checkAppStatus()..checkAuthentication()),
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => TabsCubit()),
        BlocProvider(create: (context) => TodoCubit(todoRepository: di())),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: state.isStarted
                ? state.status == AppAuthStatus.authenticated
                    ? const DashboardPage()
                    : const LoginPage()
                : const GetStartedPage(),
          );
        },
      ),
    );
  }
}
