import 'package:testingapi/data/model/api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
abstract class CountryRepository {
  Future<List<Countries>> getCountries();
}


class Countryrepoimpl implements  CountryRepository {

  @override
  Future<List<Countries>> getCountries() async {
    var response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Countries> countries = Covid.fromJson(data).countries;
      return countries;
    } else {
      throw Exception();
    }
  }



}