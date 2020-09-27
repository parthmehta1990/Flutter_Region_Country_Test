import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regioncountryapp/Model/CountryModelEntity.dart';

class Detail extends StatelessWidget {
  final CountryModelEntity detail;

  Detail({Key key, @required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(color: Colors.black12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    detail.region + ' /',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                      child: Text(' ' + detail.name,
                          style: TextStyle(color: Colors.blue)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Row(children: [
                SvgPicture.network(
                  detail.flag,
                  width: 100,
                  height: 50,
                  placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              detail.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(5, 4, 0, 0),
                                child: Text(
                                  '(' + detail.alpha3Code + ')',
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 12,textBaseline: TextBaseline.alphabetic),
                                ))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(detail.capital))
                    ],
                  ),
                )
              ]),
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Container(
                height: 90,
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demonym',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      detail.demonym,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 90,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calling Code',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      '+' + detail.callingCodes[0],
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  ],
                ),
              )),
            ]),
            Row(children: <Widget>[
              Expanded(
                  child: Container(
                height: 90,
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Currency',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      '' +
                          detail.currencies[0].symbol +
                          " " +
                          detail.currencies[0].name,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 90,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Population',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      detail.population.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  ],
                ),
              )),
            ])
          ],
        ),
      ),
    );
  }
}
