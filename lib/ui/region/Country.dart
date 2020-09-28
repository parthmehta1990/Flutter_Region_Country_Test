import 'package:flutter/material.dart';
import '../../Model/CountryModelEntity.dart';
import '../../CommonComponent/ComComp.dart';
import '../../API/Constants.dart';
import '../../API/RegionAPI.dart';
import '../Detail.dart';

class Country extends StatefulWidget {

  final String continent;
  Color primaryColor;
  Country({Key key,  @required this.continent,@required this.primaryColor}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Country> {

  bool isHomeDataLoading;

  @override
  void initState() {
    super.initState();
    isHomeDataLoading = false;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: ComComp.getAppBar(COLORS.APP_THEME_COLOR, "Country"),
      body: Container(
        child: FutureBuilder<List<CountryModelEntity>>(
          future: RegionAPI.fetchHomeData(widget.continent),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                ? ComComp.homeGrid(snapshot, gridClicked,widget.primaryColor)
                : ComComp.retryButton(fetch)
                : ComComp.circularProgress();
          },
        ),
      ),
    );
  }

  setLoading(bool loading) {
    setState(() {
      isHomeDataLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }
}

gridClicked(BuildContext context, CountryModelEntity cellModel) {
  // Grid Click

 /* print("item clicked=${cellModel.name}");
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Detail(detail: cellModel),
    ),
  );*/

}
