import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/CountryModelEntity.dart';
import 'Constants.dart';
import 'dart:developer';

class RegionAPI {
  static Future<List<CountryModelEntity>> fetchHomeData(String continent) async {
    final response = await http.get(APPURLS.SAMPLE_URL+"region/"+continent);
    try {
      print("The number is ${response.statusCode}");
      if (response.statusCode == 200) {
        print('data:==='+response.body);
        List<CountryModelEntity> list = parsePostsForHome(response.body);


        return list;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(MESSAGES.INTERNET_ERROR);
    }
  }

  static List<CountryModelEntity> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CountryModelEntity>((json) => CountryModelEntity.fromJson(json)).toList();
  }
}