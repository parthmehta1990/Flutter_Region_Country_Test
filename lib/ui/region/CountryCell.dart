import 'package:flutter/material.dart';
import '../../Model/CountryModelEntity.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Detail.dart';


class CountryCell extends StatefulWidget {

  CountryCell(this.countryModelEntity,this.primaryColor);
  @required
  final CountryModelEntity countryModelEntity;
  @required
  Color primaryColor;

  @override
  _CountryCellState createState() => _CountryCellState();
}

class _CountryCellState extends State<CountryCell> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          color: widget.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(

            width: 1, //                   <--- border width here
          ),
        ),
        child: InkWell(
          splashColor: Colors.black.withOpacity(0.7),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(detail:  widget.countryModelEntity),
              ),
            );
          },
          child: Padding(
            padding:
            new EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                child: SvgPicture.network(
                  widget.countryModelEntity.flag,
                //width:(MediaQuery.of(context).size.width/2)-100,
                height: 100,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
            ),
              ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.countryModelEntity.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700,color:Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}