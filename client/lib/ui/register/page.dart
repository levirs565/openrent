import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/components/password_text_field.dart';
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
        if (state.submissionStatus == .finished) {
          Navigator.of(
            context,
          ).pushAndRemoveUntil(LoginPage.route(), (_) => false);
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.app_registration_outlined,
                        size: 36,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Buat Akun Baru',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              onChanged: (email) => context
                                  .read<RegisterCubit>()
                                  .onEmailChanged(email),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'nama@domain.com',
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              onChanged: (name) => context
                                  .read<RegisterCubit>()
                                  .onNameChanged(name),
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                labelText: 'Nama Lengkap',
                                hintText: 'Nama sesuai KTP atau identitas',
                              ),
                            ),
                            const SizedBox(height: 16),
                            PasswordTextField(
                              onChanged: (password) => context
                                  .read<RegisterCubit>()
                                  .onPasswordChanged(password),
                              labelText: 'Password',
                              hintText: 'Minimal 8 karakter',
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 16),
                            PasswordTextField(
                              onChanged: (repeatPassword) => context
                                  .read<RegisterCubit>()
                                  .onRepeatPasswordChanged(repeatPassword),
                              labelText: 'Ulangi Password',
                              hintText: 'Ketik ulang password Anda',
                              textInputAction: TextInputAction.done,
                            ),
                            if (state.error != null) ...[
                              const SizedBox(height: 16),
                              Text(
                                state.error!.message,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                              ),
                            ],
                            const SizedBox(height: 24),
                            LoadingButton(
                              isLoading: state.submissionStatus == .loading,
                              onPressed:
                                  (!state.isValid ||
                                      state.submissionStatus != .idle)
                                  ? null
                                  : () => context
                                        .read<RegisterCubit>()
                                        .onSubmit(),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                child: Text('Daftar'),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pushAndRemoveUntil(
                                      LoginPage.route(),
                                      (_) => false,
                                    ),
                                child: const Text('Sudah punya akun? Masuk'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Dengan mendaftar, Anda menyetujui syarat dan ketentuan kami.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
