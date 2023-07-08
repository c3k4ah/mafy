// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsModel {
  final String name;
  final List<Color> colors;
  final Icon icon;
  final bool isActive;
  SettingsModel({
    required this.name,
    required this.colors,
    required this.icon,
    required this.isActive,
  });
}
