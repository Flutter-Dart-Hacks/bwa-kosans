import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  const FacilityItem(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.total})
      : super(key: key);

  final String name;
  final String imageUrl;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}
