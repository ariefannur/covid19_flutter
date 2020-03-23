
import 'package:covid19_app/data/api/statistic_api.dart';
import 'package:covid19_app/data/bloc/statistic_bloc.dart';
import 'package:covid19_app/data/bloc/statistic_state.dart';
import 'package:covid19_app/widget/main/navigation/navigation.dart';
import 'package:covid19_app/widget/main/screen/call_center/call_center.dart';
import 'package:covid19_app/widget/main/screen/dashboard/dasboard.dart';
import 'package:covid19_app/widget/main/screen/info/info.dart';
import 'package:covid19_app/widget/main/screen/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {
  int position = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final StatisticApi statisticApi = StatisticApi(httpClient: http.Client());

    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        StatisticBloc(statisticApi),
        child:
          Container(
            color: Colors.grey[300],
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 54, top: 50),
                  child: position == 0 ?
                    Dashboard()
                  : position == 1 ?
                  Info() 
                  : position == 2 ? 
                  CallCenter() : 
                  MapScreen(),
                ),
                Positioned(child: Navigation(
                  onPosition: (position) {
                    setState(() {
                      this.position = position;
                    });
                  },
                ), bottom: 0),
              ],
            ),
          ),
      )
    );
  }

}