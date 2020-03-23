import 'package:covid19_app/data/model/statiistic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class GetIndoensiaStatus extends StatisticEvent {}
class GetChineStatus extends StatisticEvent {}
class GetKoreatatus extends StatisticEvent {}
class GetItaliaStatus extends StatisticEvent {}
class EmptyStatus extends StatisticEvent {}

class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object> get props => [];
}

class IndonesiaStatusLoaded extends StatisticState {
  final Statistic statistik;

  const IndonesiaStatusLoaded({@required this.statistik}) : assert(statistik != null);

  @override
  List<Object> get props => [statistik];
}

class ChinaStatusLoaded extends StatisticState {
  final Statistic statistik;

  const ChinaStatusLoaded({@required this.statistik}) : assert(statistik != null);

  @override
  List<Object> get props => [statistik];
}

class ItaliaStatusLoaded extends StatisticState {
  final Statistic statistik;

  const ItaliaStatusLoaded({@required this.statistik}) : assert(statistik != null);

  @override
  List<Object> get props => [statistik];
}

class KoreaStatusLoaded extends StatisticState {
  final Statistic statistik;

  const KoreaStatusLoaded({@required this.statistik}) : assert(statistik != null);

  @override
  List<Object> get props => [statistik];
}