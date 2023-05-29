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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 15,
            ),
            child: const CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              startWeekday: WeekDay.monday,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radiusWidget),
                  bottomRight: Radius.circular(radiusWidget),
                ),
              ),
              child: const Center(
                child: Text(
                  "Le succès n'est pas final, l'échec n'est pas fatal. C'est le courage de continuer qui compte",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
