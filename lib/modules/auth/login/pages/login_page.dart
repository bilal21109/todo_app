import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/injection/di.dart';
import 'package:todo_app/modules/dashboard/pages/dashboard_page.dart';

import '../../forgot_password/pages/forgot_password_page.dart';
import '../../signup/pages/sign_up.dart';
import '../cubit/log_in_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(auth: di()),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
      if (state.status == AuthLogInStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      }
          if (state.status == AuthLogInStatus.success) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DashboardPage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Image.asset(
                    'assets/images/png/user.png',
                    height: 200,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login Page',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _emailController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        focusColor: Colors.black87,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        filled: true,
                        focusColor: Colors.black87,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordPage()),
                          );
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: state.status == AuthLogInStatus.loading
                        ? () {}
                        : () {
                            context
                                .read<LogInCubit>()
                                .signInWithEmailAndPassword(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim());
                          },

                    child: state.status==AuthLogInStatus.loading? Center(
                      child: CircularProgressIndicator(),
                    )
                       : const Text(
                      'Login',
                      style: (TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      )
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: const Size.fromWidth(150),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Sign up with',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Image.asset(
                          'assets/images/png/google.png',
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        'assets/images/png/fb.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        'assets/images/png/ios.png',
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Do not have an account?'),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
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
    );
  }
}
