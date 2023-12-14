import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/login_bloc/login_bloc.dart';
import '../../../data/services/db_service.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_show_snackbar.dart';
import '../../widgets/my_text_form_field.dart';
import 'register_auth_screen.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  bool _obscureText = true;

  final GlobalKey<FormState> _logInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loadUserData() async {
    final user = await DBService().getUser();
    if (user != null) {
      _emailController.text = user['email'];
      _passwordController.text = user['password'];
    }
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
            const Text(
              'Masuk',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _logInFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  MyTextFormField(
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    'Kata sandi',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  MyTextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    suffixIcon: InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        myShowSnackBar(
                          context,
                          content: 'Login error, cek data anda',
                        );
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MyElevatedButton(
                        title: 'Masuk',
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                DoLoginEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Baru di SNKRS?'),
                      const SizedBox(
                        width: 4.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterAuthScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
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
