import 'package:bwa_kosans/models/city_data.dart';
import 'package:bwa_kosans/models/space_data.dart';
import 'package:bwa_kosans/models/tips_data.dart';
import 'package:bwa_kosans/providers/spaces_provider.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:bwa_kosans/widgets/bottom_navbar_item.dart';
import 'package:bwa_kosans/widgets/city_card.dart';
import 'package:bwa_kosans/widgets/space_card.dart';
import 'package:bwa_kosans/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // var spacesProvider = Provider.of<SpaceProvider>(context);
    var spaceProvider = context.watch<SpaceProvider>();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
          child: Scrollbar(
            controller: _scrollController,
            child: ListView(
              controller: _scrollController,
              children: [
                // NOTE: TITLE / HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: edgePadding, vertical: 20),
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
                // NOTE: SPACE PAGES
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: FutureBuilder(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<SpaceData> listspace = snapshot.data ?? [];

                          int indexData = 0;

                          return Column(
                            children: listspace.map((itemspace) {
                              indexData += 1;
                              return Container(
                                margin: EdgeInsets.only(
                                  top: indexData == 0 ? 0 : 20,
                                ),
                                child: SpaceCard(spaceData: itemspace),
                              );
                            }).toList(),
                          );

                          // return Column(
                          //   children: [
                          //     SpaceCard(
                          //       spaceData: SpaceData(
                          //         id: 1,
                          //         name: 'Kuretakeso Garden',
                          //         imageUrl: 'resources/images/space1.png',
                          //         price: 52,
                          //         city: 'Bandung',
                          //         country: 'Germany',
                          //         rating: 4,
                          //         address: '',
                          //         phone: '',
                          //         mapUrl: '',
                          //         listPhotos: [],
                          //         numberOfKitchens: 0,
                          //         numberOfBedrooms: 0,
                          //         numberOfCupboards: 0,
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       height: 20,
                          //     ),
                          //     SpaceCard(
                          //       spaceData: SpaceData(
                          //         id: 2,
                          //         name: 'Roemah Nenek',
                          //         imageUrl: 'resources/images/space2.png',
                          //         price: 11,
                          //         city: 'Seattle',
                          //         country: 'Bogor',
                          //         rating: 5,
                          //         address: '',
                          //         phone: '',
                          //         mapUrl: '',
                          //         listPhotos: [],
                          //         numberOfKitchens: 0,
                          //         numberOfBedrooms: 0,
                          //         numberOfCupboards: 0,
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       height: 20,
                          //     ),
                          //     SpaceCard(
                          //       spaceData: SpaceData(
                          //         id: 3,
                          //         name: 'Darrling How',
                          //         imageUrl: 'resources/images/space3.png',
                          //         price: 20,
                          //         city: 'Jakarta',
                          //         country: 'Indonesia',
                          //         rating: 3,
                          //         address: '',
                          //         phone: '',
                          //         mapUrl: '',
                          //         listPhotos: [],
                          //         numberOfKitchens: 0,
                          //         numberOfBedrooms: 0,
                          //         numberOfCupboards: 0,
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       height: 20,
                          //     ),
                          //   ],
                          // );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                // NOTE: TIPS GUIDANCE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edgePadding),
                  child: Text(
                    'Tips & Guidance',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      TipsGuidanceCard(
                        tipsData: TipsData(
                            id: 1,
                            imageUrl: 'resources/images/tips1.png',
                            title: 'City Guidelines',
                            updatedAt: '20 Apr'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TipsGuidanceCard(
                        tipsData: TipsData(
                            id: 2,
                            imageUrl: 'resources/images/tips2.png',
                            title: 'Jakarta Fairship',
                            updatedAt: '11 Dec'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edgePadding),
        margin: const EdgeInsets.symmetric(horizontal: edgePadding),
        decoration: BoxDecoration(
          color: greyBottombarColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavbarItem(
              imageUrl: 'resources/images/icon_home.png',
              isSelected: true,
            ),
            BottomNavbarItem(
              imageUrl: 'resources/images/icon_mail.png',
              isSelected: false,
            ),
            BottomNavbarItem(
              imageUrl: 'resources/images/icon_card.png',
              isSelected: false,
            ),
            BottomNavbarItem(
              imageUrl: 'resources/images/icon_love.png',
              isSelected: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
