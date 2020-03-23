import 'package:covid19_app/widget/main/navigation/icon.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final Function onPosition;
  Navigation({this.onPosition});
  
  @override
  State<StatefulWidget> createState() => NavigationState();

}

class NavigationState extends State<Navigation> {
  int position = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GestureDetector(child:IconNav(type: "home", selected: position == 0), onTap: (){
            setState((){ position = 0;});
            widget.onPosition(position);
          }),
          GestureDetector(child:IconNav(type: "info", selected: position == 1), onTap: (){
            setState((){ position = 1;});
            widget.onPosition(position);
          }),
          GestureDetector(child:IconNav(type: "chat", selected: position == 2), onTap: (){
            setState((){ position = 2;});
            widget.onPosition(position);
          }),
          GestureDetector(child:IconNav(type: "upload", selected: position == 3), onTap: (){
            setState((){ position = 3;});
            widget.onPosition(position);
          }),
          
        ],
      ),
    );
  }

}