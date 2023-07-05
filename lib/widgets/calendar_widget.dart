import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_inset.dart';
import '../utils/quotes.dart';
import 'border_radius.dart';

class CalendarWidget extends StatefulWidget {
  final Size size;

  const CalendarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  String quote = "";
  String owner = "";
  bool working = false;

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  void fetchQuote() async {
    setState(() {
      working = true;
      quote = owner = "";
    });

    var quoteData = await CalendarLogic.getQuote();

    setState(() {
      quote = quoteData['quote']!;
      owner = quoteData['owner']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
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
                ),
              ),
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
                child: Column(
                  children: [
                    Text(
                      owner != null ? owner : "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        quote != null ? quote : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
