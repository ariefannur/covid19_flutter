import 'package:flutter/material.dart';

class IconNav extends StatefulWidget {
  final bool selected;
  final String type;
  IconNav({this.selected, this.type});

  @override
  State<StatefulWidget> createState() => IconNavState();

}

class IconNavState extends State<IconNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
      Icon(getTypeImage(widget.type, widget.selected), size: 20, color: widget.selected ? Colors.black54 : Colors.grey[400]),
      Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Icon(
            Icons.brightness_1,
            size: 6,
            color: widget.selected ? Colors.black54 : Colors.white,
          ))
    ]));
  }

  getTypeImage(String type, bool selected) {
    if (type == "home") {
      return selected ? Icons.dashboard : Icons.dashboard;
    } else if (type == "info") {
      return selected ? Icons.tab : Icons.tab_unselected;
    } else if (type == "chat") {
      return selected ? Icons.chat_bubble : Icons.chat_bubble_outline;
    } else {
      return selected ? Icons.file_upload : Icons.file_upload;
    }

  }
}
