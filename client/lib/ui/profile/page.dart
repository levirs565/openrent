import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/bloc/auth.dart';
import 'package:openrent_client/data/auth.dart';
import 'package:openrent_client/data/resource.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (state.state is ResourceSuccess)
            Text(
              (state.state as ResourceSuccess<AuthUserState?>).data?.name ?? "",
            ),
          Center(
            child: OutlinedButton(
              onPressed: () =>
                  context.read<AuthBloc>().add(AuthBlocEventLogout()),
              child: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
