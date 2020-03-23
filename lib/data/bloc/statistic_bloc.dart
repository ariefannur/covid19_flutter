import 'package:bloc/bloc.dart';
import 'package:covid19_app/data/api/statistic_api.dart';
import 'package:covid19_app/data/bloc/statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final StatisticApi statisticApi;
  StatisticBloc(this.statisticApi);

  @override
  StatisticState get initialState => StatisticState();

  @override
  Stream<StatisticState> mapEventToState(StatisticEvent event) async* {
    if (event is GetIndoensiaStatus) {
      final data = await statisticApi.getCountriesStatus("ID");
      yield IndonesiaStatusLoaded(statistik: data);
    } 
     else if (event is GetChineStatus) {
      final data = await statisticApi.getCountriesStatus("CN");
      yield ChinaStatusLoaded(statistik: data);
    } 
     else if (event is GetItaliaStatus) {
      final data = await statisticApi.getCountriesStatus("IT");
      yield ItaliaStatusLoaded(statistik: data);
    } 
     else if (event is GetKoreatatus) {
      final data = await statisticApi.getCountriesStatus("MY");
      yield KoreaStatusLoaded(statistik: data);
    }
  }

}