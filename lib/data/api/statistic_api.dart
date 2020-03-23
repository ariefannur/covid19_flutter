import 'dart:convert';

import 'package:covid19_app/data/model/statiistic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticApi {
  static const baseUrl = "https://covid19.mathdro.id/api";
  final http.Client httpClient;

  StatisticApi({@required this.httpClient});

  Future<Statistic> getCountriesStatus(String code) async {
    final path = '$baseUrl/countries/$code';
    final status = await this.httpClient.get(path);
    if(status.statusCode == 200) {
      return Statistic.fromJson(jsonDecode(status.body));
    } else {
      return null;
    }

  }

}
