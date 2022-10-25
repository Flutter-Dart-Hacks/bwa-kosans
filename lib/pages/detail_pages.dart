import 'package:bwa_kosans/pages/home_pages.dart';
import 'package:bwa_kosans/themes.dart';
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
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 270,
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
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: edgePadding),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Kuretakeso Garden',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
