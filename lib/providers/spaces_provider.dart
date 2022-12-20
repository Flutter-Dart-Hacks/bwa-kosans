import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future parseListData(String jsonData) async {
    List listdata = jsonDecode(jsonData);
  }

  getRecommendedSpaces() async {
    try {
      http.Response resultRequest = await http
          .get(Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces'));

      if (resultRequest.statusCode == 200 || resultRequest.statusCode == 201) {}
    } catch (err) {
      print(err);
    }
  }
}
