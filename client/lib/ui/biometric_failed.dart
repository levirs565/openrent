import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/bloc/auth.dart';

class BiometricFailedPage extends StatelessWidget {
  const BiometricFailedPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const BiometricFailedPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text("Biometric Failed"),
      OutlinedButton(onPressed: () => context.read<AuthBloc>().add(AuthBlocEventStart()), child: Text("Retry")),
      OutlinedButton(onPressed: () => context.read<AuthBloc>().add(AuthBlocEventLogout()), child: Text("Logout"))
    ],),);
  }
}