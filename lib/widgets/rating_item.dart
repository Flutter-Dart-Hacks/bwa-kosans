import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({Key? key, required this.index, required this.rating})
      : super(key: key);

  final int index;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        index <= rating
            ? 'resources/images/icon_star_solid.png'
            : 'resources/images/icon_star_solid_grey.png',
        height: 20,
        width: 20,
        fit: BoxFit.contain,
      ),
    );
  }
}
