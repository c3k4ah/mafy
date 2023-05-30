// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_inset.dart';

class PreviewImageWidget extends StatelessWidget {
  final Size size;
  const PreviewImageWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
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
          )),
    );
  }
}
