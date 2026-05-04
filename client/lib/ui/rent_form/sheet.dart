import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openrent_client/ui/components/calendar.dart';
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
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => RentFormCubit(
              id: id,
              productRepository: context.read(),
              rentRepository: context.read(),
              exchangeRatesRepository: context.read(),
              settingsRepository: context.read(),
            ),
            child: _RentFormSheetContent(),
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
          Navigator.pop(context);
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
      builder: (context, state) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text("Rent"),
            if (state.isLoading) LinearProgressIndicator(),
            TableCalendar(
              focusedDay: state.startDate,
              firstDay: tz.TZDateTime.now(state.timeZone),
              // TODO: Constant
              lastDay: DateTime.utc(2099, 12, 30),
              rangeStartDay: DateUtils.dateOnly(state.startDate),
              rangeEndDay: DateUtils.dateOnly(state.endDate),
              rangeSelectionMode: .enforced,
              enabledDayPredicate: (day) =>
                  context.read<RentFormCubit>().getAvailableStock(day) > 0,
              onRangeSelected: (start, end, focusedDay) {
                final cubit = context.read<RentFormCubit>();
                if (start != null || end != null) {
                  cubit.setSelectedRange((start ?? end)!, (end ?? start)!);
                }
              },
              calendarBuilders: createCalenderBuilderWithStock(
                (day) => context.read<RentFormCubit>().getAvailableStock(day),
              ),
            ),
            Text("${state.normalizedStart}-${state.normalizedEnd}"),
            Text("Price ${state.priceIdr} IDR or ${state.price}"),
            OutlinedButton(
              onPressed: !state.canSubmit
                  ? null
                  : () => context.read<RentFormCubit>().onSubmit(),
              child: Text("Rent"),
            ),
          ],
        ),
      ),
    );
  }
}
