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
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 120,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    spaceData.imageUrl,
                    fit: BoxFit.cover,
                    width: 120,
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
            width: 10,
          ),
          // Gunakan expanded agar text tidak melebihi ukuran layar
          // Gunakan container box pada text
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spaceData.name,
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
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
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.all(1),
                  child: Text(
                    '${spaceData.city}, ${spaceData.country}. Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                // ConstrainedBox(
                //   constraints: BoxConstraints.loose(
                //       Size.fromWidth(MediaQuery.of(context).size.width / 2)),
                //   child: Text(
                //     '${spaceData.city}, ${spaceData.country} Kata yang sangat panjang sekali',
                //     maxLines: 5,
                //     overflow: TextOverflow.ellipsis,
                //     style: greyTextStyle.copyWith(
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
              ],
            ),
          )
          // Gambar Space
        ],
      ),
    );
  }
}
