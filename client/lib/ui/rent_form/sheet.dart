import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:openrent_client/ui/components/calendar.dart';
import 'package:openrent_client/ui/components/currency_format.dart';
import 'package:openrent_client/ui/components/loading_button.dart';
import 'package:openrent_client/ui/my_order_detail/page.dart';
import 'package:openrent_client/ui/rent_form/cubit.dart';
import 'package:openrent_client/ui/rent_form/state.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/timezone.dart' as tz;

class RentFormSheet extends StatelessWidget {
  final int id;

  const RentFormSheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: Snackbar need Scaffold, but scaffold make sheet fill height
    return ScaffoldMessenger(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocProvider(
              create: (context) => RentFormCubit(
                id: id,
                productRepository: context.read(),
                rentRepository: context.read(),
                exchangeRatesRepository: context.read(),
                settingsRepository: context.read(),
              ),
              child: const _RentFormSheetContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class _RentFormSheetContent extends StatelessWidget {
  const _RentFormSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Maybe overfloww
    return BlocConsumer<RentFormCubit, RentFormState>(
      listener: (context, state) {
        if (state.actionStatus == .finished) {
          Navigator.pushReplacement(context, MyOrderDetailPage.route(state.rentId!));
          context.read<RentFormCubit>().onActionSuccessHandled();
        }
        if (state.error != null) {
          final source = state.error!.source;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.message),
              action: source == .submit || source == .dateRanges
                  ? null
                  : SnackBarAction(
                      label: "Refresh",
                      onPressed: () {
                        final cubit = context.read<RentFormCubit>();
                        if (source == .data) {
                          cubit.onRefresh();
                        } else {
                          cubit.onRefreshExchangeRate();
                        }
                      },
                    ),
            ),
          );
          context.read<RentFormCubit>().onErrorHandled(state.error!);
        }
      },
      builder: (context, state) {
        final theme = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withOpacity(0.24),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Gap(16),
              Text('Rental Detail', style: theme.textTheme.titleLarge),
              const Gap(8),
              Text(
                'Pilih rentang tanggal yang tersedia untuk menyewa produk ini.',
                style: theme.textTheme.bodyMedium,
              ),
              const Gap(16),
              if (state.isLoading) const LinearProgressIndicator(),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TableCalendar(
                    focusedDay: state.startDate,
                    firstDay: tz.TZDateTime.now(state.timeZone),
                    lastDay: DateTime.utc(2099, 12, 30),
                    rangeStartDay: DateUtils.dateOnly(state.startDate),
                    rangeEndDay: DateUtils.dateOnly(state.endDate),
                    rangeSelectionMode: RangeSelectionMode.enforced,
                    enabledDayPredicate: (day) =>
                        context.read<RentFormCubit>().getAvailableStock(day) >
                        0,
                    onRangeSelected: (start, end, focusedDay) {
                      final cubit = context.read<RentFormCubit>();
                      if (start != null || end != null) {
                        cubit.setSelectedRange(
                          (start ?? end)!,
                          (end ?? start)!,
                        );
                      }
                    },
                    calendarBuilders: createCalenderBuilderWithStock(
                      (day) =>
                          context.read<RentFormCubit>().getAvailableStock(day),
                        state.timeZone
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Summary', style: theme.textTheme.titleMedium),
                      const Gap(12),
                      Text('Period:', style: theme.textTheme.bodyMedium),
                      Text(
                        '${_formatTimestamp(state.normalizedStart)} — ${_formatTimestamp(state.normalizedEnd)}',
                        style: theme.textTheme.bodyLarge,
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price:', style: theme.textTheme.bodyMedium),
                          Text(
                            '${state.priceIdr} IDR',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimated conversion:',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '${state.price?.toStringAsFixed(2)} ${state.selectedCurrency}',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: state.canSubmit
                    ? () => context.read<RentFormCubit>().onSubmit()
                    : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text('Sewa Sekarang'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
  }
}
