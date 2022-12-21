import 'package:bwa_kosans/models/detail_arguments.dart';
import 'package:bwa_kosans/models/space_data.dart';
import 'package:bwa_kosans/pages/detail_pages.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  const SpaceCard({Key? key, required this.spaceData}) : super(key: key);
  final SpaceData spaceData;

  navigasiNoNamedDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const DetailPage();
        },
      ),
    );
  }

  void navigasiNamedRouteDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      DetailPage.routeName,
      arguments: DetailArguments(
          stringPayload: 'data_detail', intPayload: 1, spaceData: spaceData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigasiNamedRouteDetail(context);
      },
      child: Row(
        children: [
          // Gambar Space
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    spaceData.imageUrl,
                    fit: BoxFit.cover,
                    width: 130,
                    height: 110,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'resources/images/icon_star_solid.png',
                            width: 22,
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              '${spaceData.rating}/5',
                              style: whiteTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spaceData.name,
                style: blackTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${spaceData.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${spaceData.city}, ${spaceData.country}',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
