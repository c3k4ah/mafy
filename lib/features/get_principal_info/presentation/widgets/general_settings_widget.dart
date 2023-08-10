// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:mafy/models/settings_model.dart';

import '../../../../colors.dart';
import '../../../../data/settings.data.dart';
import '../../../../size_inset.dart';

class GeneralSettingsWisget extends StatelessWidget {
  final Size size;
  const GeneralSettingsWisget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(radiusWidget),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(settingList.length, (index) {
          SettingsModel setting = settingList[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              color: setting.colors[0],
              borderRadius: BorderRadius.circular(radiusWidget),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: setting.colors[1],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: setting.icon,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: size.width,
                        child: Text(
                          setting.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: setting.colors[1],
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                setting.isActive
                    ? const SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                          color: darkPrimaryColor.withOpacity(.6),
                          borderRadius: BorderRadius.circular(radiusWidget),
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
