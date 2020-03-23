import 'package:covid19_app/widget/main/screen/info/item_info.dart';
import 'package:covid19_app/widget/main/screen/info/search.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoState();

}

class InfoState extends State<Info> {
  final data = [
    InfoData("How it spread?", "assets/images/icon/ic_virus.png", "Learn how covid-19 spread"),
    InfoData("Symptions", "assets/images/icon/ic_touch.png", "Learn how covid-19 spread"),
    InfoData("Prevention & Treatment", "assets/images/icon/ic_wash.png", "Learn how covid-19 spread"),
    InfoData("What to do?", "assets/images/icon/ic_scanner.png", "Learn how covid-19 spread"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text("Information", style: TextStyle(color: Colors.black, fontSize: 18)),
        Search(),
        Expanded(child: 
        ListView.builder(itemBuilder: (context, pos){
          return ItemInfo(title:data[pos].title, icon:data[pos].icon, desc:data[pos].desc);
        },
        itemCount: data.length,
        ))
      ],)
    );
  }

}