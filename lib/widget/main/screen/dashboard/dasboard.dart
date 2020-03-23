import 'dart:async';

import 'package:covid19_app/data/api/statistic_api.dart';
import 'package:covid19_app/data/bloc/statistic_bloc.dart';
import 'package:covid19_app/data/bloc/statistic_state.dart';
import 'package:covid19_app/widget/main/screen/dashboard/item_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardState();

}

class DashboardState extends State<Dashboard> {
    StatisticApi statisticApi;
  final listData = List();
    @override
  void initState() {
    super.initState();
     statisticApi = StatisticApi(httpClient: http.Client());
     listData.clear();
     
  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StatisticBloc>(context).add(EmptyStatus());
    Timer(Duration(microseconds: 300),(){
        BlocProvider.of<StatisticBloc>(context).add(GetIndoensiaStatus());
    BlocProvider.of<StatisticBloc>(context).add(GetKoreatatus());
    BlocProvider.of<StatisticBloc>(context).add(GetChineStatus());
    BlocProvider.of<StatisticBloc>(context).add(GetItaliaStatus());
    });

    return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column (children: <Widget>[
          Row(
            children: <Widget>[
              Text("Covid 19", style: TextStyle(color: Colors.black, fontSize: 24)),
            ],
          ),
          BlocBuilder<StatisticBloc, StatisticState>(
            builder: (context, state) { 
              if (state is IndonesiaStatusLoaded) {
              listData.add(
                Statistik(title: "INDONESIA SITUATION", confirmCount: state.statistik.confirmed.value.toString(),
                   recoveredCount:  state.statistik.recovered.value.toString(), 
                   death:  state.statistik.deaths.value.toString()));
              
              } else 
               if (state is ChinaStatusLoaded) {
               listData.add( Statistik(title: "CHINA SITUATION", confirmCount: state.statistik.confirmed.value.toString(),
                   recoveredCount:  state.statistik.recovered.value.toString(), 
                   death:  state.statistik.deaths.value.toString()),
                );
              } else if (state is ItaliaStatusLoaded) {
                listData.add( Statistik(title: "ITALIA SITUATION", confirmCount: state.statistik.confirmed.value.toString(),
                   recoveredCount:  state.statistik.recovered.value.toString(), 
                   death:  state.statistik.deaths.value.toString()),
                );
              } else if (state is KoreaStatusLoaded) {
               listData.add(Statistik(title: "MALAYSIA SITUATION", confirmCount: state.statistik.confirmed.value.toString(),
                   recoveredCount:  state.statistik.recovered.value.toString(), 
                   death:  state.statistik.deaths.value.toString()),
                );
              }else {
                listData.clear();
              }

              return Expanded(child:
              RefreshIndicator(child:ListView.builder(
                itemBuilder: (context, pos){
                  return ItemDashboard(statistik: listData[pos]);
              }, itemCount: listData.length),
              onRefresh: _refresh
              )
              );
            }
          ),
          // ItemDashboard(
          //   statistik: Statistik(title: "GLOBAL SITUATION", confirmCount: "29", confirmProsentase: "20%", suspectCount: "50", suspectProsentase: "10%"),
          // )
        ])
      );
  }

  Future<Null> _refresh() {
    listData.clear();
  return Future.delayed(Duration(seconds: 1), () {
    BlocProvider.of<StatisticBloc>(context).add(GetIndoensiaStatus());
    BlocProvider.of<StatisticBloc>(context).add(GetKoreatatus());
    BlocProvider.of<StatisticBloc>(context).add(GetChineStatus());
    BlocProvider.of<StatisticBloc>(context).add(GetItaliaStatus());
  });
}

}