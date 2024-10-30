import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/injection/di.dart';
import 'package:todo_app/modules/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:todo_app/modules/auth/login/pages/login_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}


class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(auth: di()),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if(state.status==ForgotPasswordStatus.sent){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Send a message on email')));
          }
          if (state.status == ForgotPasswordStatus.sent) {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: state.status == ForgotPasswordStatus.sending
                      ? () {}
                      : () {
                          context
                              .read<ForgotPasswordCubit>()
                              .resetPassword(_emailController.text.trim());
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    fixedSize: Size.fromWidth(150),
                  ),
                  child: state.status == ForgotPasswordStatus.sending
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Send Password'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
