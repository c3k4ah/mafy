import 'package:flutter/material.dart';
import 'package:mafy/colors.dart';

import '../models/settings_model.dart';

List<SettingsModel> settingList = [
  SettingsModel(
    isActive: false,
    name: "Wifi",
    colors: [tertioColor, primaryColor],
    icon: Icon(
      Icons.wifi,
      color: tertioColor,
    ),
  ),
  SettingsModel(
    isActive: true,
    name: "Mode avion",
    colors: [secondaryColor, tertioColor],
    icon: Icon(
      Icons.airplanemode_active,
      color: secondaryColor,
    ),
  ),
  SettingsModel(
    isActive: false,
    name: "Bluetooth",
    colors: [Colors.blue.shade700, whiteColor],
    icon: Icon(
      Icons.bluetooth,
      color: Colors.blue.shade700,
    ),
  ),
  SettingsModel(
    isActive: false,
    name: "Luminosité",
    colors: [whiteColor, secondaryColor],
    icon: Icon(
      Icons.light_mode,
      color: whiteColor,
    ),
  ),
];
