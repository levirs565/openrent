import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/register/cubit.dart';
import 'package:openrent_client/ui/register/state.dart';

import '../login/page.dart';

/* TODO: AI Search, Location Filter, Map View, Filter by Location
    Filter by Date, Sort*/

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(authRepository: context.read()),
      child: _RegisterForm(),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!.message)));
          context.read<RegisterCubit>().onErrorHandled(state.error!);
        }
        if (state.submissionStatus == RegisterSubmissionStatus.finished) {
          Navigator.of(
            context,
          ).pushAndRemoveUntil(LoginPage.route(), (_) => false);
        }
      },
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            TextField(
              onChanged: (email) =>
                  context.read<RegisterCubit>().onEmailChanged(email),
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              onChanged: (name) =>
                  context.read<RegisterCubit>().onNameChanged(name),
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextField(
              onChanged: (password) =>
                  context.read<RegisterCubit>().onPasswordChanged(password),
              decoration: InputDecoration(label: Text("Password")),
            ),
            TextField(
              onChanged: (repeatPassword) => context
                  .read<RegisterCubit>()
                  .onRepeatPasswordChanged(repeatPassword),
              decoration: InputDecoration(label: Text("Repeat Password")),
            ),
            if (state.submissionStatus == RegisterSubmissionStatus.submitting)
              CircularProgressIndicator(),
            OutlinedButton(
              onPressed:
                  !state.isValid ||
                      state.submissionStatus != RegisterSubmissionStatus.idle
                  ? null
                  : () => context.read<RegisterCubit>().onSubmit(),
              child: Text("Register"),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(
                context,
              ).pushAndRemoveUntil(LoginPage.route(), (_) => false),
              child: Text("Sudah punya akun? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
