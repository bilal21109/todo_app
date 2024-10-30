import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/injection/di.dart';
import 'package:todo_app/modules/auth/login/pages/login_page.dart';
import 'package:todo_app/modules/auth/signup/cubit/sign_up_cubit.dart';
import 'package:todo_app/modules/dashboard/pages/dashboard_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      create: (context) => SignUpCubit(auth: di()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status == AuthSignUpStatus.success) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DashboardPage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/png/user.png', height: 200),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.password_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: state.status == AuthSignUpStatus.loading
                      ? () {}
                      : () {
                          context
                              .read<SignUpCubit>()
                              .registerWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim());
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    fixedSize: const Size.fromWidth(150),
                  ),
                  child: state.status == AuthSignUpStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Sign Up'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
