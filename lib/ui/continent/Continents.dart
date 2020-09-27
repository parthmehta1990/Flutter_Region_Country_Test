import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:regioncountryapp/ui/region/Country.dart';
import 'dart:convert';
import '../../Model/ContinentModel.dart';

class Continents extends StatefulWidget {
  Continents({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCotinentState createState() => _MyCotinentState();
}

class _MyCotinentState extends State<Continents> {
  final String apiURL = 'https://restcountries.eu/rest/v2/all?fields=region';

  Future<List<ContinentModel>> fetchJSONData() async {
    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
          json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<ContinentModel> usersList = jsonItems.map<ContinentModel>((json) {
        print("json ${json['region']}");

        return ContinentModel.fromJson(json);
      }).toList();

      print("data=${usersList.toSet().toList()}");

      return usersList.toSet().toList();
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<ContinentModel>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map(
                  (user) => ListTile(
                    title: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(user.region),
                      //color: user.userColor,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                          color: user.userColor,
                          border: Border.all(width: 1, color: Colors.black38)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Country(
                              continent: user.region,
                              primaryColor: user.userColor),
                        ),
                      );
                      print(user.region);
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
