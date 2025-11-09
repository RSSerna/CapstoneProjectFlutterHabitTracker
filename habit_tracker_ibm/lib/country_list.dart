import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  try {
    final uri = Uri.https('restcountries.com', '/v3.1/all', {'fields': 'name'});
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> countriesJson = json.decode(response.body);
      List<String> countryList = countriesJson
          .map((country) => country['name']['common'] as String)
          .toList();
      return countryList;
    } else {
      debugPrint(
          'Failed to load countries: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
      throw Exception('Failed to load countries');
    }
  } catch (e) {
    debugPrint('Error fetching countries: $e');
    throw Exception('Error fetching countries: $e');
  }
}
