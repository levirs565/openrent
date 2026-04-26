import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/components/password_text_field.dart';
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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
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
                          Icons.home_outlined,
                          size: 36,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Selamat Datang di OpenRent',
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
                                    .read<LoginCubit>()
                                    .onEmailChanged(email),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'nama@domain.com',
                                ),
                              ),
                              const SizedBox(height: 16),
                              PasswordTextField(
                                onChanged: (password) => context
                                    .read<LoginCubit>()
                                    .onPasswordChanged(password),
                                labelText: 'Password',
                                hintText: 'Minimal 8 karakter',
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
                                isLoading: state.isSubmit,
                                onPressed: () =>
                                    context.read<LoginCubit>().onSubmit(),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Text('Masuk'),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pushAndRemoveUntil(
                                        RegisterPage.route(),
                                        (_) => false,
                                      ),
                                  child: const Text('Belum punya akun? Daftar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Dengan masuk, Anda menyetujui syarat dan ketentuan layanan kami.',
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
        );
      },
    );
  }
}
