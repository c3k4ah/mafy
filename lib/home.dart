import 'package:flutter/material.dart';

import 'colors.dart';
import 'size_inset.dart';
import 'widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: width,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      DayLinesWidget(
                        size: Size(100, height),
                      ),
                      Expanded(
                        child: CalendarWidget(
                          size: Size(
                            width,
                            height,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: width * .4,
                                  height: height,
                                  margin: const EdgeInsets.only(right: 14),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius:
                                        BorderRadius.circular(radiusWidget),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: width * .4,
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius:
                                        BorderRadius.circular(radiusWidget),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            width: width,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(radiusWidget),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(radiusWidget),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
