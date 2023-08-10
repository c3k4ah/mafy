// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';

import '../../../../colors.dart';
import '../../../../size_inset.dart';

class PreviewImageWidget extends StatefulWidget {
  final Size size;
  const PreviewImageWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<PreviewImageWidget> createState() => _PreviewImageWidgetState();
}

class _PreviewImageWidgetState extends State<PreviewImageWidget> {
  double brightness = 0.0;
  @override
  void initState() {
    currentBrightness.then((value) {
      brightness = value * 100;
      print(brightness);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: widget.size.height,
        margin: const EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(radiusWidget),
          image: const DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            width: 4,
            color: secondaryColor,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(radiusWidget),
          ),
          child: Center(child: Text((brightness).toStringAsFixed(2))),
        ),
      ),
    );
  }

  Future<double> get currentBrightness async {
    try {
      return await ScreenBrightness().current;
    } catch (e) {
      print(e);
      throw 'Failed to get current brightness';
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }
}
