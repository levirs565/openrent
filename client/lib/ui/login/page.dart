import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/login/cubit.dart';
import 'package:openrent_client/ui/login/state.dart';
import 'package:openrent_client/ui/register/page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepository: context.read()),
      child: _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!.message)));
          context.read<LoginCubit>().onErrorHandled(state.error!);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              onChanged: (email) =>
                  context.read<LoginCubit>().onEmailChanged(email),
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              onChanged: (password) =>
                  context.read<LoginCubit>().onPasswordChanged(password),
              decoration: InputDecoration(label: Text("Password")),
            ),
            OutlinedButton(
              onPressed: () => context.read<LoginCubit>().onSubmit(),
              child: Text("Login"),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(
                context,
              ).pushAndRemoveUntil(RegisterPage.route(), (_) => false),
              child: Text("Belum punya akun? Regsiter"),
            ),
          ],
        ),
      ),
    );
  }
}
