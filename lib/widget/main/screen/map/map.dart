import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-7.797558, 110.371221),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    final listData = [
      DataMap(
          title: "RSUP Dr Sarjito",
          desc:
              "Jl. Kesehatan No.1, Senolowo Sleman"),
      DataMap(
          title: "RS Betesda",
          desc:
              "Jl. Jend. Sudirman No.70, Kotabaru"),
      DataMap(
          title: "RSUP Dr Sarjito",
          desc:
              "Jl. Kesehatan No.1, Senolowo Sleman"),
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child:
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )),
        Align(child:
        Container(
          margin: EdgeInsets.only(bottom: 30),
          height: 65, child:
          ListView.builder(
                    itemBuilder: (context, pos) {
                      return ItemMap(
                        title: listData[pos].title,
                        desc: listData[pos].desc,
                      );
                    },
                    itemCount: listData.length,
                    scrollDirection: Axis.horizontal),   
        ),
        alignment: Alignment.bottomCenter,
        )
         
         
      ],
    ));
  }
}

class DataMap {
  String title;
  String desc;
  DataMap({this.title, this.desc});
}

class ItemMap extends StatelessWidget {
  final String title;
  final String desc;
  ItemMap({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 8, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/images/icon/ic_home.png', width: 43),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontSize: 16)),
                    Text(desc,
                        style: TextStyle(fontSize: 12, color: Colors.grey), overflow: TextOverflow.ellipsis,),
                  ],
                ))
          ],
        ));
  }
}
