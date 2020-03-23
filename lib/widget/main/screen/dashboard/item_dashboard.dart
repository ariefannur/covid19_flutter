import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final Statistik statistik;
  ItemDashboard({this.statistik});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(statistik.title, style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                   Text(statistik.confirmCount, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   Text("Confirm", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
              // Column(
              //   children: <Widget>[
              //      Icon(Icons.arrow_upward, size: 16, color: Colors.grey,),
              //      Text(statistik.confirmProsentase, style: TextStyle(fontSize: 14, color: Colors.grey)),
              //   ],
              // ),
              Column(
                children: <Widget>[
                   Text(statistik.recoveredCount, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   Text("Recovered", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
               Column(
                children: <Widget>[
                   Text(statistik.death, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   Text("Deaths", style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
              // Column(
              //   children: <Widget>[
              //      Icon(Icons.arrow_downward, size: 16, color: Colors.grey,),
              //      Text(statistik.suspectProsentase, style: TextStyle(fontSize: 14, color: Colors.grey)),
              //   ],
              // )
            ],
          )
        ],
      )
    );
  }

}

class Statistik {
  String title;
  String confirmCount;
  String recoveredCount;
  String death;

  Statistik({this.title, this.confirmCount, this.recoveredCount, this.death});
}