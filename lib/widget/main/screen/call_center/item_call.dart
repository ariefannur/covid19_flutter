import 'package:flutter/material.dart';

class ItemCall extends StatelessWidget {
  String title;
  String address;
  ItemCall({Key key, this.title, this.address}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(title, style: TextStyle(fontSize: 16)),
          Text(address, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
        Spacer(),
        Padding(padding: EdgeInsets.only(right: 16), child: Image.asset("assets/images/icon/ic_telephone.png", width: 36)),
        Image.asset("assets/images/icon/ic_chat.png", width: 36,)
      ])
    );
  }

}