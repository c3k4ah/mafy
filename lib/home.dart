import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'features/get_principal_info/presentation/widgets/calendar_widget.dart';
import 'features/get_principal_info/presentation/widgets/day_lines_widget.dart';
import 'features/get_principal_info/presentation/widgets/favorite_app_widget.dart';
import 'features/get_principal_info/presentation/widgets/general_settings_widget.dart';
import 'features/get_principal_info/presentation/widgets/preview_image_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              color: whiteColor.withOpacity(.2),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: SafeArea(
                child: ListView(
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
                    Container(
                      width: width,
                      height: 250,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 250,
                        child: Row(
                          children: [
                            Expanded(
                              child: FavoriteAppsWidget(
                                size: Size(width, height),
                              ),
                            ),
                            Expanded(
                              child: PreviewImageWidget(
                                size: Size(width, height),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GeneralSettingsWisget(
                      size: Size(width, height),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: width,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
