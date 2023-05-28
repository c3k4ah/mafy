// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_inset.dart';

class CalendarWidget extends StatelessWidget {
  final Size size;
  const CalendarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radiusWidget),
      ),
      child: const CleanCalendar(
        datePickerCalendarView: DatePickerCalendarView.weekView,
      ),
    );
  }
}
