import 'dart:convert';

import 'package:bwa_kosans/models/space_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  // Parse data json dari future
  Future<List<SpaceData>> parseListData(String jsonData) async {
    List listdata = jsonDecode(jsonData);
    List<SpaceData> listSpace =
        listdata.map((item) => SpaceData.fromJsons(item)).toList();
    return listSpace;
  }

  Future<List<SpaceData>> getRecommendedSpaces() async {
    List<SpaceData> listDataSpace = [];
    try {
      http.Response resultRequest = await http
          .get(Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces'));

      if (resultRequest.statusCode == 200 || resultRequest.statusCode == 201) {
        listDataSpace = await parseListData(resultRequest.body);
      }
    } catch (err) {
      print(err);
    }
    return listDataSpace;
  }
}
