import 'package:flutter/material.dart';
import 'package:mafy/models/daystage_model.dart';

DayStageModel getCurrentStage() {
  int currentHour = DateTime.now().hour;
  int currentMinute = DateTime.now().minute;
  if (currentHour >= 4 && currentHour < 6) {
    //entre 04 et 6h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 04, minute: 01),
        end: DateTime.now().copyWith(hour: 05, minute: 59),
      ),
      name: 'sunrise',
      urlImage: 'assets/images/day_stages/sunrise.jpg',
    );
  } else if (currentHour >= 6 && currentHour < 12) {
    //entre 06h et 12h
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 06, minute: 00),
        end: DateTime.now().copyWith(hour: 11, minute: 59),
      ),
      name: 'morning',
      urlImage: 'assets/images/day_stages/morning.jpg',
    );
  } else if (currentHour == 12) {
    //entre 12h00 et 12h59
    return DayStageModel(
      range: DateTimeRange(
        start: DateTime.now().copyWith(hour: 12, minute: 00),
        end: DateTime.now().copyWith(hour: 12, minute: 59),
      ),
      name: 'noon',
      urlImage: 'assets/images/day_stages/noon.jpg',
    );
  } else if (currentHour >= 13 && currentHour < 17) {
    //entre 13h00 et 17h
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
