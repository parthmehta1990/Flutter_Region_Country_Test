import 'package:flutter/material.dart';
import '../../Model/CountryModelEntity.dart';
import '../../CommonComponent/ComComp.dart';
import '../../API/Constants.dart';
import '../../API/RegionAPI.dart';
import '../Detail.dart';

class Country extends StatefulWidget {

  final String continent;
  Country({Key key,  @required this.continent}) : super(key: key);



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
      body: Center(
        child: Container(
          child: FutureBuilder<List<CountryModelEntity>>(
            future: RegionAPI.fetchHomeData(widget.continent),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData
                  ? ComComp.homeGrid(snapshot, gridClicked)
                  : ComComp.retryButton(fetch)
                  : ComComp.circularProgress();
            },
          ),
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
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Detail(),
    ),
  );

}
