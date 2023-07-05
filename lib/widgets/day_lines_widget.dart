import 'package:flutter/material.dart';
import 'package:mafy/models/daystage_model.dart';
import 'package:mafy/widgets/weather.dart';
import 'package:mafy/widgets/widget.dart';

import '../colors.dart';
import '../size_inset.dart';
import '../utils/daystages.dart';
import '../utils/parsing.dart';

class DayLinesWidget extends StatelessWidget {
  final Size size;
  const DayLinesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DayStageModel stage = getCurrentStage(DateTime.now());
    String hour = addZero(DateTime.now().hour);
    String min = addZero(DateTime.now().minute);
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(radiusWidget),
      ),
      child: Column(
        children: [
          Container(
            height: 145,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: topRadius(),
              image: DecorationImage(
                image: AssetImage(stage.urlImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: size.width,
                  height: 30,
                  child: Text(
                    '$hour:$min',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          WeatherW(size: size)
        ],
      ),
    );
  }
}
