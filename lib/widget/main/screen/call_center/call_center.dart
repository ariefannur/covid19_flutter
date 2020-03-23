import 'package:covid19_app/widget/main/screen/call_center/item_call.dart';
import 'package:flutter/material.dart';

class CallCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CallCenterState();

}

class CallCenterState extends State<CallCenter> {
  final data = [
    DataItem("RS Sarjito", "Jl. Sainstech UGM"),
    DataItem("RS Betesda", "Jl. Sudirman no 2"),
    DataItem("RS Pantirapih", "Jl. Sainstech UGM"),
    DataItem("RSA UGM", "Jl. Kabupatan no 2 Sleman"),
    DataItem("RS JIH", "Jl. Ring Road Utara")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
         Text("Information Center", style: TextStyle(color: Colors.black, fontSize: 18)),
         Expanded(child: 
         ListView.builder(itemBuilder: (context, pos) {
           return ItemCall(title: data[pos].title, address: data[pos].address);
         }, itemCount: data.length)
         )
      ])
      
    );
  }

}

class DataItem {
  String title;
  String address;
  DataItem(this.title, this.address);
}