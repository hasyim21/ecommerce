import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/register_bloc/register_bloc.dart';
import '../../widgets/my_elevated_button.dart';
import '../../widgets/my_icon_button.dart';
import '../../widgets/my_show_snackbar.dart';
import '../../widgets/my_text_form_field.dart';
import 'login_auth_screen.dart';

class RegisterAuthScreen extends StatefulWidget {
  const RegisterAuthScreen({super.key});

  @override
  State<RegisterAuthScreen> createState() => _RegisterAuthScreenState();
}

class _RegisterAuthScreenState extends State<RegisterAuthScreen> {
  bool _obscureText = true;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              'Daftar',
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
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  MyTextFormField(
                    controller: _usernameController,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
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
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterFailure) {
                        myShowSnackBar(
                          context,
                          content: state.error,
                        );
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MyElevatedButton(
                        title: 'Daftar',
                        onPressed: () {
                          context.read<RegisterBloc>().add(
                                DoRegisterEvent(
                                  username: _usernameController.text,
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
                      const Text('Punya akun?'),
                      const SizedBox(
                        width: 4.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginAuthScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Masuk',
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
