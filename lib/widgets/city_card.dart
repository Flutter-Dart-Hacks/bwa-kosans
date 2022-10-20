import 'package:bwa_kosans/models/city_data.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class CardCity extends StatelessWidget {
  final CityData cityData;

  const CardCity({Key? key, required this.cityData}) : super(key: key);

  Widget cekStatusPopularStars(CityData cityData) {
    if (cityData.isFavorite) {
      return Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 50,
          height: 30,
          decoration: const BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Image.asset(
              'resources/images/icon_star_solid.png',
              width: 22,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 180,
        width: 120,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  cityData.imageUrl,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 115,
                ),
                cekStatusPopularStars(cityData),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              cityData.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
