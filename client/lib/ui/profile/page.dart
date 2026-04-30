import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';
import 'package:openrent_client/ui/my_addresses/page.dart';
import 'package:openrent_client/ui/profile/cubit.dart';
import 'package:openrent_client/ui/profile/state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        settingsRepository: context.read(),
        authRepository: context.read(),
      ),
      child: BlocBuilder<AuthBloc, AuthBlocState>(
        builder: (context, state) {
          final user = state.state is AuthStateSuccess
              ? (state.state as AuthStateSuccess).user
              : null;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profil Saya'),
              centerTitle: true,
              elevation: 0,
            ),
            body: SafeArea(child: _Content(user: user)),
          );
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key, required this.user});

  final AuthUserState? user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!.message)));
          context.read<ProfileCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        // TODO: Progressbar when upload
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                          backgroundImage: user?.avatarUrl == null
                              ? null
                              : NetworkImage(user!.avatarUrl!),
                          child: user?.avatarUrl != null
                              ? null
                              : Icon(
                                  Icons.person,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  size: 32,
                                ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.name ?? 'Pengguna',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                user?.email ?? 'Belum ada email',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            FilledButton(
              onPressed: state.isUploadingAvatar
                  ? null
                  : () async {
                      final cubit = context.read<ProfileCubit>();
                      final picker = ImagePicker();
                      final file = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (file != null) {
                        cubit.onUploadAvatar(file);
                      }
                    },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Upload Avatar'),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () =>
                  Navigator.of(context).push(MyAddressesPage.route()),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Alamat Saya'),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: !state.canUseBiometric
                  ? null
                  : () => context.read<ProfileCubit>().onToggleBiometrics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: state.isBiometricOn
                    ? Text('Nonaktifkan Biometric')
                    : Text("Aktifkan Biometric"),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () =>
                  context.read<AuthBloc>().add(AuthBlocEventLogout()),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Keluar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
