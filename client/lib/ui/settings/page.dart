import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/controlled_text_field.dart';
import 'package:openrent_client/ui/settings/state.dart';

import 'cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        settingsRepository: context.read(),
        exchangeRatesRepository: context.read(),
      ),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: Text("Settings")),
          body: _Content(),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: SnackBarAction(
                label: "Refresh",
                onPressed: () =>
                    context.read<SettingsCubit>().onRefreshExchangeRate(),
              ),
            ),
          );
          context.read<SettingsCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            if (state.currencyStatus == .loading)
              const LinearProgressIndicator(),
            SwitchListTile(
              title: const Text('Kunci Biometrik'),
              subtitle: const Text(
                'Gunakan kunci biometrik untuk membuka aplikasi',
              ),
              value: state.isBiometricOn,
              onChanged: !state.canUseBiometric
                  ? null
                  : (value) =>
                        context.read<SettingsCubit>().onToggleBiometrics(),
            ),
            const Divider(),
            ListTile(
              title: const Text('Mata Uang'),
              subtitle: ControlledTextField<SettingsCubit, SettingsState>(
                selector: (state) => state.currency,
                builder: (controller) => DropdownMenu<String>(
                  controller: controller,
                  selectOnly: true,
                  enabled: state.currencyStatus == .success,
                  // label: const Text('Currency'),
                  dropdownMenuEntries: state.currencyList
                      .map(
                        (item) => DropdownMenuEntry(value: item, label: item),
                      )
                      .toList(),
                  onSelected: (value) => context
                      .read<SettingsCubit>()
                      .onCurrencyChanged(value ?? "IDR"),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Zona Waktu'),
              subtitle: ControlledTextField<SettingsCubit, SettingsState>(
                selector: (state) => state.timeZoneList[state.timeZone] ?? "",
                builder: (controller) => DropdownMenu<String>(
                  controller: controller,
                  selectOnly: true,
                  enabled: state.currencyStatus == .success,
                  // label: const Text('Time Zone'),
                  dropdownMenuEntries: state.timeZoneList.entries
                      .map(
                        (item) => DropdownMenuEntry(
                          value: item.key,
                          label: item.value,
                        ),
                      )
                      .toList(),
                  onSelected: (value) => context
                      .read<SettingsCubit>()
                      .onTimeZoneChanged(value ?? "Asia/Jakarta"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
