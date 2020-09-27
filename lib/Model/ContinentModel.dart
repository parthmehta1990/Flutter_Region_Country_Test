import 'dart:math';

import 'package:flutter/material.dart';

class ContinentModel {
  String region;
  Color userColor;

  ContinentModel({this.region});

  @override
  String toString() {
    return '${this.region}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContinentModel &&
          runtimeType == other.runtimeType &&
          region == other.region;

  @override
  int get hashCode => region.hashCode;

  ContinentModel.fromJson(Map<String, dynamic> json) {
    if(json['region'].toString()!=null) {
      print('In continent ${json['region'].toString()}');
      region = json['region'];
      userColor=Colors
          .primaries[Random().nextInt(Colors.primaries.length)];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['userColor']=this.userColor;
    return data;
  }
}
