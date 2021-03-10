import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final CalendarController _calendarController;
  final DateTime startDay;

  Calendar(this._calendarController, {this.startDay});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;

    return TableCalendar(
      startDay: startDay,
      initialCalendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          weekdayStyle: textStyles.bodyTextStyle,
          weekendStyle: textStyles.boldBodyTextStyle,
          unavailableStyle: textStyles.grayTextStyle,
          outsideStyle: textStyles.bodyTextStyle,
          outsideWeekendStyle: textStyles.boldBodyTextStyle
      ),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          centerHeaderTitle: true,
          titleTextStyle: textStyles.bodyTextStyle,
          leftChevronIcon: Icon(Icons.chevron_left, color: AppColors.textColor),
          rightChevronIcon: Icon(Icons.chevron_right, color: AppColors.textColor)
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: textStyles.bodyTextStyle,
          weekendStyle: textStyles.boldBodyTextStyle
      ),
      calendarController: _calendarController,
    );
  }

}