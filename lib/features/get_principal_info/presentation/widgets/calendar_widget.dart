// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafy/features/get_principal_info/presentation/widgets/widget.dart';

import '../../../../colors.dart';
import '../../../../size_inset.dart';
import '../bloc/principal_bloc.dart';

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
            child: BlocBuilder<PrincipalInfoBloc, PrincipalInfoState>(
                builder: (context, state) {
              switch (state.status) {
                case PrincipalInfoStatus.loading:
                  return const CircularProgressIndicator();

                case PrincipalInfoStatus.done:
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: tertioColor,
                      borderRadius: bottomRadius(),
                    ),
                    child: Center(
                      child: Text(
                        state.currentCitation.quote,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: darkPrimaryColor,
                          fontFamily: 'Caveat',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                case PrincipalInfoStatus.failure:
                  return Text(state.error);
                default:
                  return const SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }
}
