import 'package:bwa_kosans/models/tips_data.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class TipsGuidanceCard extends StatefulWidget {
  const TipsGuidanceCard({Key? key, required this.tipsData}) : super(key: key);

  final TipsData tipsData;

  @override
  State<TipsGuidanceCard> createState() => _TipsGuidanceCardState();
}

class _TipsGuidanceCardState extends State<TipsGuidanceCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          widget.tipsData.imageUrl,
          fit: BoxFit.contain,
          width: 80,
          height: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tipsData.title,
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${widget.tipsData.updatedAt}',
              style: greyTextStyle.copyWith(
                fontSize: 14,
              ),
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_right,
            size: 28,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
