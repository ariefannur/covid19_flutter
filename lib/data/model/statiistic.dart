import 'package:equatable/equatable.dart';

class Statistic extends Equatable {

  final Data confirmed;
  final Data recovered;
  final Data deaths;
  final String lastUpdate;

  const Statistic({this.confirmed, this.recovered, this.deaths, this.lastUpdate});

  @override
  List<Object> get props => [confirmed, recovered, deaths, this.lastUpdate];

  static Statistic fromJson(dynamic json) {
    
    return Statistic(
      confirmed: Data(value:json['confirmed']['value'], detail: json['confirmed']['detail']),
      recovered: Data(value:json['recovered']['value'], detail: json['recovered']['detail']),
      deaths: Data(value:json['deaths']['value'], detail: json['deaths']['detail']), lastUpdate: json['lastUpdate']); 
  }
  
}

class Data extends Equatable {

  final int value;
  final String detail;

  Data({ this.value, this.detail});

  @override
  List<Object> get props => [value, detail];

  static Data fromJson(dynamic json) {
    print("confrm : "+json.toString());
    return Data(value: json['value'], detail: json['detail']);
  }

}