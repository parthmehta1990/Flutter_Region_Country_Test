import 'package:flutter/material.dart';
import '../../Model/CountryModelEntity.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CountryCell extends StatelessWidget {

  CountryCell(this.countryModelEntity,this.primaryColor);
  @required
  final CountryModelEntity countryModelEntity;
  @required
  Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5)
        ),
        child: Padding(
          padding:
          new EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            SvgPicture.network(
              countryModelEntity.flag,
            width: 100,
            height: 100,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  countryModelEntity.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500,color:Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}