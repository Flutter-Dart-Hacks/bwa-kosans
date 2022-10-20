import 'package:bwa_kosans/models/city_data.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:bwa_kosans/widgets/city_card.dart';
import 'package:bwa_kosans/widgets/space_card.dart';
import 'package:flutter/material.dart';

class HomePageMenu extends StatefulWidget {
  const HomePageMenu({Key? key}) : super(key: key);

  static const String routeName = "/homepage";

  @override
  State<HomePageMenu> createState() => _HomePageMenuState();
}

class _HomePageMenuState extends State<HomePageMenu> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: edgePadding,
          ),
          child: ListView(
            controller: _scrollController,
            children: [
              // NOTE: TITLE / HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: edgePadding),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: edgePadding),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // NOTE: POPULAR CITIES
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: edgePadding),
                child: Text(
                  'Popular Cities',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 180,
                alignment: Alignment.topLeft,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: edgePadding,
                    ),
                    CardCity(
                      cityData: CityData(
                          id: 1,
                          name: 'Jakarta',
                          imageUrl: 'resources/images/city1.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CardCity(
                      cityData: CityData(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'resources/images/city2.png',
                        isFavorite: true,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CardCity(
                      cityData: CityData(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'resources/images/city3.png',
                        isFavorite: true,
                      ),
                    ),
                    const SizedBox(
                      width: edgePadding,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: RECOMMENDED SPACE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: edgePadding),
                child: Text(
                  'Recommended Space',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: const [
                  SpaceCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
