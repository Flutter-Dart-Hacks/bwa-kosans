import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem(
      {Key? key, required this.imageUrl, required this.isSelected})
      : super(key: key);

  final String imageUrl;
  final bool isSelected;

  Container checkStatusActiveLine(BuildContext context, bool isactive) {
    if (isactive) {
      return Container(
        width: 30,
        height: 4,
        decoration: const BoxDecoration(
          color: purpleNavbarColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(1000),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          fit: BoxFit.contain,
          width: 26,
          height: 26,
        ),
        const Spacer(),
        checkStatusActiveLine(context, isSelected),
      ],
    );
  }
}
