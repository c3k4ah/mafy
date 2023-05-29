// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_inset.dart';

class FavoriteAppsWidget extends StatelessWidget {
  final Size size;
  const FavoriteAppsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .4,
      height: size.height,
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(radiusWidget),
      ),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 15,
          children: List.generate(
            4,
            (index) => Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(radiusWidget)),
            ),
          ),
        ),
      ),
    );
  }
}
