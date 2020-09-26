class ContinentModel {
  String region;

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
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    return data;
  }
}
