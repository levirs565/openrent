import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarBuilders<dynamic> createCalenderBuilderWithStock(
  int Function(DateTime day) stockGetter,
) {
  return CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day),
    disabledBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isDisabled: true),
    todayBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isToday: true),
    rangeStartBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isRangeStart: true),
    rangeEndBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isRangeEnd: true),
    withinRangeBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isWithinRange: true),
    outsideBuilder: (context, day, focusedDay) =>
        _buildCalendarCell(context, stockGetter, day, isOutside: true),
  );
}

bool _isWeekend(
  DateTime day, {
  List<int> weekendDays = const [DateTime.saturday, DateTime.sunday],
}) {
  return weekendDays.contains(day.weekday);
}

Widget? _buildCalendarCell(
  BuildContext context,
  int Function(DateTime day) stockGetter,
  DateTime day, {
  bool isToday = false,
  bool isRangeStart = false,
  bool isRangeEnd = false,
  bool isWithinRange = false,
  bool isOutside = false,
  bool isDisabled = false,
}) {
  int stock = stockGetter(day);
  bool isAvailable = stock > 0;

  const calendarStyle = CalendarStyle();
  final margin = calendarStyle.cellMargin;
  final padding = calendarStyle.cellPadding;
  final alignment = calendarStyle.cellAlignment;
  const duration = Duration(milliseconds: 250);
  final text = '${day.day}';
  final isWeekend = _isWeekend(day);

  return AnimatedContainer(
    duration: duration,
    margin: margin,
    padding: padding,
    decoration: isDisabled
        ? calendarStyle.disabledDecoration
        : isOutside
        ? calendarStyle.outsideDecoration
        : isWithinRange
        ? calendarStyle.withinRangeDecoration
        : isRangeEnd
        ? calendarStyle.rangeEndDecoration
        : isRangeStart
        ? calendarStyle.rangeStartDecoration
        : isToday
        ? calendarStyle.todayDecoration
        : isWeekend
        ? calendarStyle.weekendDecoration
        : calendarStyle.defaultDecoration,
    alignment: alignment,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              (isDisabled
                      ? calendarStyle.disabledTextStyle
                      : isOutside
                      ? calendarStyle.outsideTextStyle
                      : isWithinRange
                      ? calendarStyle.withinRangeTextStyle
                      : isRangeEnd
                      ? calendarStyle.rangeEndTextStyle
                      : isRangeStart
                      ? calendarStyle.rangeStartTextStyle
                      : isToday
                      ? calendarStyle.todayTextStyle
                      : isWeekend
                      ? calendarStyle.weekendTextStyle
                      : calendarStyle.defaultTextStyle)
                  .copyWith(height: 0),
        ),
        if (!isDisabled || (!day.isBefore(DateUtils.dateOnly(DateTime.now()))))
          Text(
            isAvailable ? '$stock sisa' : 'Habis',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              height: 0,
              fontSize: 10,
              color: isAvailable ? null : Theme.of(context).colorScheme.error,
            ),
          ),
      ],
    ),
  );
}
