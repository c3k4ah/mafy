// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:mafy/widgets/widget.dart';

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
            child: CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
              startWeekday: WeekDay.monday,
              currentDateProperties: DatesProperties(
                  datesDecoration: DatesDecoration(
                datesBackgroundColor: tertioColor,
                datesTextColor: whiteColor,
                datesBorderColor: darkPrimaryColor,
              )),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: tertioColor,
                borderRadius: bottomRadius(),
              ),
              child: Center(
                child: Text(
                  "Le succès n'est pas final, l'échec n'est pas fatal. C'est le courage de continuer qui compte",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteColor,
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
