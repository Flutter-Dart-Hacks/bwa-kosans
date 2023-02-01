import 'package:bwa_kosans/models/detail_arguments.dart';
import 'package:bwa_kosans/models/space_data.dart';
import 'package:bwa_kosans/pages/error_pages.dart';
import 'package:bwa_kosans/pages/home_pages.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:bwa_kosans/widgets/facility_item.dart';
import 'package:bwa_kosans/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const String routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorited = false;

  navigasiKembaliHalamanSebelumnya(BuildContext context) {
    print('Tap button kembali');
    // Push dan pop sampai router name
    // https://stackoverflow.com/questions/49672706/flutter-navigation-pop-to-index-1
    // https://stackoverflow.com/questions/45424621/inkwell-not-showing-ripple-effect
    Navigator.popUntil(context, (route) {
      return route.settings.name == HomePageMenu.routeName;
    });
  }

  // Build context mesti dilakukan pengecekan terlebih dahulu
  // https://dart-lang.github.io/linter/lints/use_build_context_synchronously.html
  openLinkUrlData(String url, BuildContext context) async {
    print(url);
    Uri uriUrl = Uri.parse(url);
    if (await canLaunchUrl(uriUrl)) {
      try {
        await launchUrl(uriUrl, mode: LaunchMode.externalApplication);
      } catch (err) {
        // print(err);
        if (context.mounted) {
          Navigator.pushNamed(context, ErrorPages.routeName);
        }
      }
    } else {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ErrorPages();
            },
          ),
        );
      }
    }
  }

  Future<void> showDialogKonfirmasiTelpon(
      BuildContext context, String nomorTelp) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah anda ingin menghubungi pemilik kosan ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  openLinkUrlData('tel:$nomorTelp', context);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  List<Widget> generateListPhotoSpace(
      BuildContext context, SpaceData spacedata) {
    // Membuat daftar foto horizontal
    // Menggunakan fade in image
    // https://stackoverflow.com/questions/49771765/flutter-default-image-to-image-network-when-it-fails
    // Jika gambar error
    List<Widget> listWidget = spacedata.listPhotos.map((urlphoto) {
      return Container(
        margin: const EdgeInsets.only(left: 18),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FadeInImage(
            placeholder: const AssetImage('resources/images/photo1.png'),
            image: NetworkImage(urlphoto),
            fit: BoxFit.cover,
            width: 110,
            height: 80,
            imageErrorBuilder: (context, error, stackTrace) {
              print(stackTrace.toString());
              return Image.asset(
                'resources/images/photo1.png',
                fit: BoxFit.cover,
                width: 110,
                height: 80,
              );
            },
          ),
        ),
      );
    }).toList();

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    DetailArguments? argsData =
        ModalRoute.of(context)?.settings.arguments as DetailArguments;

    SpaceData? spaceData = argsData.spaceData;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Image.asset(
            //   'resources/images/thumbnail_detail.png',
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width,
            //   height: 350,
            // ),
            Image.network(
              spaceData?.imageUrl ?? '',
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          spaceData?.name ?? '',
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
                                            text:
                                                '\$${(spaceData?.price ?? '')}',
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
                                  ),
                                  Row(
                                    children: [1, 2, 3, 4, 5].map((index) {
                                      return Container(
                                        margin: const EdgeInsets.only(left: 2),
                                        child: RatingItem(
                                            index: index,
                                            rating: spaceData?.rating ?? 0),
                                      );
                                    }).toList(),
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
                                children: [
                                  FacilityItem(
                                    name: 'kitchen',
                                    total: spaceData?.numberOfKitchens ?? 0,
                                    imageUrl: 'resources/images/ic_kitchen.png',
                                  ),
                                  FacilityItem(
                                    name: 'bedroom',
                                    total: spaceData?.numberOfBedrooms ?? 0,
                                    imageUrl: 'resources/images/ic_bedroom.png',
                                  ),
                                  FacilityItem(
                                    name: 'Big Lemari',
                                    total: spaceData?.numberOfCupboards ?? 0,
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
                                    children: spaceData?.listPhotos != null
                                        ? generateListPhotoSpace(
                                            context, spaceData!)
                                        : [],
                                    // children: [
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    //   Image.asset(
                                    //     'resources/images/photo1.png',
                                    //     fit: BoxFit.cover,
                                    //     width: 110,
                                    //     height: 88,
                                    //   ),
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    //   Image.asset(
                                    //     'resources/images/photo2.png',
                                    //     fit: BoxFit.cover,
                                    //     width: 110,
                                    //     height: 88,
                                    //   ),
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    //   Image.asset(
                                    //     'resources/images/photo3.png',
                                    //     fit: BoxFit.cover,
                                    //     width: 110,
                                    //     height: 88,
                                    //   ),
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    //   Image.asset(
                                    //     'resources/images/photo2.png',
                                    //     fit: BoxFit.cover,
                                    //     width: 110,
                                    //     height: 88,
                                    //   ),
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    //   Image.asset(
                                    //     'resources/images/photo1.png',
                                    //     fit: BoxFit.cover,
                                    //     width: 110,
                                    //     height: 88,
                                    //   ),
                                    //   const SizedBox(
                                    //     width: 18,
                                    //   ),
                                    // ],
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
                                    '${spaceData?.address ?? ''} \n${spaceData?.city ?? ''}',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // openLinkUrlData(
                                      //     'https://www.google.com/maps/@-6.9007143,107.6188714,16.5z',
                                      //     context);
                                      // testing halaman error
                                      // openLinkUrlData('abcde5z', context);
                                      if (spaceData?.mapUrl != null) {
                                        openLinkUrlData(
                                            spaceData!.mapUrl, context);
                                      }
                                    },
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
                            onPressed: () {
                              // openLinkUrlData(
                              //     'tel:${spaceData?.phone ?? ''}', context);
                              showDialogKonfirmasiTelpon(
                                  context, spaceData?.phone ?? '');
                            },
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
            // NOTE: BUTTON NAVIGASI BAR
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    child: Image.asset(
                      isFavorited
                          ? 'resources/images/ic_btn_wishlist_filled.png'
                          : 'resources/images/ic_btn_wishlist.png',
                      fit: BoxFit.contain,
                      width: 40,
                      height: 40,
                    ),
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
