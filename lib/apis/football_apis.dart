import 'package:soccer_app/apis/api_manager.dart';
import 'package:soccer_app/models/soccer_model.dart';

class FootballApis {
  late ApiManager apiManager;
  FootballApis() {
    apiManager = ApiManager();
  }

  getLiveMatches() async {
    try {
      var result = await apiManager.getData(
        "/fixtures",
        query: {"live": "all"},
        headers: {
          'x-rapidapi-host': 'v3.football.api-sports.io',
          'x-rapidapi-key': "a9bcdd487abce38170771a24abfba0d5",
        },
      );

      SoccerModel soccerModel = SoccerModel.fromJson(result.data);
      return soccerModel;
    } catch (e) {
      throw Exception("SomeThing Went Wrong, ${e.toString()}");
    }
  }
}
