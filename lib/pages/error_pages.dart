import 'package:bwa_kosans/pages/home_pages.dart';
import 'package:bwa_kosans/themes.dart';
import 'package:flutter/material.dart';

class ErrorPages extends StatefulWidget {
  const ErrorPages({Key? key}) : super(key: key);

  static const String routeName = '/error404';

  @override
  State<ErrorPages> createState() => _ErrorPagesState();
}

class _ErrorPagesState extends State<ErrorPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'resources/images/ic_404.png',
                fit: BoxFit.contain,
                width: 300,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: edgePadding),
                height: 50,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePageMenu.routeName, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: Text(
                    'Back to Home',
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
