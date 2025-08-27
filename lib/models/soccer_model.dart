class SoccerModel {
  final String get;
  final Map<String, dynamic> parameters;
  final List<dynamic> errors;
  final int results;
  final Paging paging;
  final List<FixtureData> response;

  SoccerModel({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  factory SoccerModel.fromJson(Map<String, dynamic> json) => SoccerModel(
    get: json["get"],
    parameters: json["parameters"],
    errors: json["errors"],
    results: json["results"],
    paging: Paging.fromJson(json["paging"]),
    response: List<FixtureData>.from(
      json["response"].map((x) => FixtureData.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "get": get,
    "parameters": parameters,
    "errors": errors,
    "results": results,
    "paging": paging.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Paging {
  final int current;
  final int total;

  Paging({required this.current, required this.total});

  factory Paging.fromJson(Map<String, dynamic> json) =>
      Paging(current: json["current"], total: json["total"]);

  Map<String, dynamic> toJson() => {"current": current, "total": total};
}

class FixtureData {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;
  final Score score;

  FixtureData({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory FixtureData.fromJson(Map<String, dynamic> json) => FixtureData(
    fixture: Fixture.fromJson(json["fixture"]),
    league: League.fromJson(json["league"]),
    teams: Teams.fromJson(json["teams"]),
    goals: Goals.fromJson(json["goals"]),
    score: Score.fromJson(json["score"]),
  );

  Map<String, dynamic> toJson() => {
    "fixture": fixture.toJson(),
    "league": league.toJson(),
    "teams": teams.toJson(),
    "goals": goals.toJson(),
    "score": score.toJson(),
  };
}

class Fixture {
  final int id;
  final String? referee;
  final String timezone;
  final String date;
  final int timestamp;
  final Periods periods;
  final Venue venue;
  final Status status;

  Fixture({
    required this.id,
    this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
    id: json["id"],
    referee: json["referee"],
    timezone: json["timezone"],
    date: json["date"],
    timestamp: json["timestamp"],
    periods: Periods.fromJson(json["periods"]),
    venue: Venue.fromJson(json["venue"]),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referee": referee,
    "timezone": timezone,
    "date": date,
    "timestamp": timestamp,
    "periods": periods.toJson(),
    "venue": venue.toJson(),
    "status": status.toJson(),
  };
}

class Periods {
  final int? first;
  final int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) =>
      Periods(first: json["first"], second: json["second"]);

  Map<String, dynamic> toJson() => {"first": first, "second": second};
}

class Venue {
  final int id;
  final String name;
  final String city;

  Venue({required this.id, required this.name, required this.city});

  factory Venue.fromJson(Map<String, dynamic> json) =>
      Venue(id: json["id"], name: json["name"], city: json["city"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "city": city};
}

class Status {
  final String long;
  final String short;
  final int? elapsed;
  final dynamic extra;

  Status({required this.long, required this.short, this.elapsed, this.extra});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    long: json["long"],
    short: json["short"],
    elapsed: json["elapsed"],
    extra: json["extra"],
  );

  Map<String, dynamic> toJson() => {
    "long": long,
    "short": short,
    "elapsed": elapsed,
    "extra": extra,
  };
}

class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final String round;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
    round: json["round"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
    "round": round,
  };
}

class Teams {
  final Team home;
  final Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
    home: Team.fromJson(json["home"]),
    away: Team.fromJson(json["away"]),
  );

  Map<String, dynamic> toJson() => {
    "home": home.toJson(),
    "away": away.toJson(),
  };
}

class Team {
  final int id;
  final String name;
  final String logo;
  final bool? winner;

  Team({required this.id, required this.name, required this.logo, this.winner});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    winner: json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "winner": winner,
  };
}

class Goals {
  final int? home;
  final int? away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) =>
      Goals(home: json["home"], away: json["away"]);

  Map<String, dynamic> toJson() => {"home": home, "away": away};
}

class Score {
  final Goals halftime;
  final Goals fulltime;
  final Goals extratime;
  final Goals penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    halftime: Goals.fromJson(json["halftime"]),
    fulltime: Goals.fromJson(json["fulltime"]),
    extratime: Goals.fromJson(json["extratime"]),
    penalty: Goals.fromJson(json["penalty"]),
  );

  Map<String, dynamic> toJson() => {
    "halftime": halftime.toJson(),
    "fulltime": fulltime.toJson(),
    "extratime": extratime.toJson(),
    "penalty": penalty.toJson(),
  };
}
