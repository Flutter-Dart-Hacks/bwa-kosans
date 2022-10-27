import 'package:bwa_kosans/pages/home_pages.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:bwa_kosans/widgets/facility_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const String routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  navigasiKembaliHalamanSebelumnya(BuildContext context) {
    print('Tap button kembali');
    // Push dan pop sampai router name
    // https://stackoverflow.com/questions/49672706/flutter-navigation-pop-to-index-1
    // https://stackoverflow.com/questions/45424621/inkwell-not-showing-ripple-effect
    Navigator.popUntil(context, (route) {
      return route.settings.name == HomePageMenu.routeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'resources/images/thumbnail_detail.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // NOTE: TITLE DETAIL HALAMAN
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: edgePadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kuretakeso Garden',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: '\$52',
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
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'resources/images/icon_star_solid.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        'resources/images/icon_star_solid.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        'resources/images/icon_star_solid.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        'resources/images/icon_star_solid.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.asset(
                                        'resources/images/icon_star_solid.png',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.contain,
                                        color: greyStar,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        // NOTE: MAIN FACILITIES
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: edgePadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Main Facilities',
                                style: regularTextStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  FacilityItem(
                                    name: 'kitchen',
                                    total: 2,
                                    imageUrl: 'resources/images/ic_kitchen.png',
                                  ),
                                  FacilityItem(
                                    name: 'bedroom',
                                    total: 3,
                                    imageUrl: 'resources/images/ic_bedroom.png',
                                  ),
                                  FacilityItem(
                                    name: 'Big Lemari',
                                    total: 3,
                                    imageUrl:
                                        'resources/images/ic_biglemari.png',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // NOTE: PHOTOS
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: edgePadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Photos',
                                style: regularTextStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 100,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image.asset(
                                        'resources/images/photo1.png',
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: 88,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image.asset(
                                        'resources/images/photo2.png',
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: 88,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image.asset(
                                        'resources/images/photo3.png',
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: 88,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image.asset(
                                        'resources/images/photo2.png',
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: 88,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Image.asset(
                                        'resources/images/photo1.png',
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: 88,
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // NOTE: LOCATION
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: edgePadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: regularTextStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Jln. Kappan Sukses No. 20 \nPalembang',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    iconSize: 50,
                                    icon: Image.asset(
                                      'resources/images/ic_btn_maps.png',
                                      fit: BoxFit.contain,
                                      width: 80,
                                      height: 80,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: edgePadding),
                          height: 50,
                          width: MediaQuery.of(context).size.width -
                              (2 * edgePadding),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 30, horizontal: edgePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      navigasiKembaliHalamanSebelumnya(context);
                    },
                    child: Image.asset(
                      'resources/images/ic_btn_back.png',
                      fit: BoxFit.contain,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Image.asset(
                    'resources/images/ic_btn_wishlist.png',
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
