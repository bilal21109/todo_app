import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/app/cubit/app_cubit.dart';
import 'package:todo_app/modules/auth/login/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state.status == AppAuthStatus.unauthenticated) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
              (route) => route.isFirst);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AppCubit>().logout();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Text('Profile page'),
        ),
      ),
    );
  }
}
