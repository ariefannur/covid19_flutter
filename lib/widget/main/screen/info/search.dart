import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[400]
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Find Information here"
        ) 
      )
    );
  }

}