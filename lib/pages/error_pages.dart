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
        child: Column(
          children: const [
            Text('Error page'),
          ],
        ),
      ),
    );
  }
}
