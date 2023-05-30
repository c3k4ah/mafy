import 'package:flutter/material.dart';
import 'package:mafy/models/daystage_model.dart';

DayStageModel getCurrentStage(DateTime dnow) {
  int currentHour = dnow.hour;
  if (currentHour >= 5 && currentHour < 7) {
    //entre 05 et 7h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 05, minute: 01),
        end: DateTime.now().copyWith(hour: 06, minute: 59),
      ),
      name: 'sunrise',
      urlImage: 'assets/images/day_stages/sunrise.jpg',
    );
  } else if (currentHour >= 7 && currentHour < 12) {
    //entre 07h et 12h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 07, minute: 00),
        end: DateTime.now().copyWith(hour: 11, minute: 59),
      ),
      name: 'morning',
      urlImage: 'assets/images/day_stages/morning.jpg',
    );
  } else if (currentHour >= 12 && currentHour < 15) {
    //entre 12h00 et 14h59
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 12, minute: 00),
        end: DateTime.now().copyWith(hour: 15, minute: 59),
      ),
      name: 'noon',
      urlImage: 'assets/images/day_stages/noon.jpg',
    );
  } else if (currentHour >= 15 && currentHour < 17) {
    //entre 15h00 et 17h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 13, minute: 00),
        end: DateTime.now().copyWith(hour: 16, minute: 59),
      ),
      name: 'afternoon',
      urlImage: 'assets/images/day_stages/afternoon.jpg',
    );
  } else if (currentHour >= 17 && currentHour < 20) {
    //entre 17h et 20h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 17, minute: 00),
        end: DateTime.now().copyWith(hour: 19, minute: 59),
      ),
      name: 'evening',
      urlImage: 'assets/images/day_stages/evening.jpg',
    );
  }
  return DayStageModel(
    range: DateTimeRange(
      start: DateTime.now().copyWith(hour: 20, minute: 00),
      end: DateTime.now()
          .add(const Duration(days: 1))
          .copyWith(hour: 03, minute: 59),
    ),
    name: 'night',
    urlImage: 'assets/images/day_stages/night.jpg',
  );
}
