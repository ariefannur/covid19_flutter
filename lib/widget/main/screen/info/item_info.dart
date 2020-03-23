import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  final String title;
  final String icon; 
  final String desc;
  ItemInfo({this.title, this.icon, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
            //
              })
              );
        },
      child:Row(
        children: <Widget>[
          Image.asset(icon, width: 43),
          Padding(padding: EdgeInsets.only(left: 16), child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(title, style: TextStyle(fontSize: 16)),
                Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )
          )
        ],
      )
      )
    );
  }

}

class InfoData {
  final String title;
  final String icon; 
  final String desc;
  InfoData(this.title, this.icon, this.desc);
}