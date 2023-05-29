import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_inset.dart';

class DayLinesWidget extends StatelessWidget {
  final Size size;
  const DayLinesWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(radiusWidget),
      ),
      child: Column(
        children: [
          Container(
            height: 145,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radiusWidget),
                topRight: Radius.circular(radiusWidget),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/daystep1.jpg'),
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
                    '06:34',
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
          Expanded(
            child: Container(
              width: size.width,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(radiusWidget),
              ),
              child: Icon(
                Icons.sunny,
                color: whiteColor,
              ),
            ),
          ),
          Container(
            height: 30,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radiusWidget),
                bottomRight: Radius.circular(radiusWidget),
              ),
            ),
            child: Text(
              '24C',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
