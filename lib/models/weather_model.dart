class Weather {
  Location location;
  Current current;

  Weather(this.location, this.current);

  factory Weather.fromJson(Map<String, dynamic> weatherData) {
    return Weather(Location.fromJson(weatherData['location']),
        Current.fromJson(weatherData['current']));
  }
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location(this.name, this.region, this.country, this.lat, this.lon, this.tzId,
      this.localtimeEpoch, this.localtime);

  factory Location.fromJson(Map<String, dynamic> locationData) {
    return Location(
        locationData['name'],
        locationData['region'],
        locationData['country'],
        locationData['lat'],
        locationData['lat'],
        locationData['tzId'],
        locationData['localtimeEpoch'],
        locationData['localtime']);
  }
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  int tempC;
  int tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  int pressureMb;
  double pressureIn;
  double precipMm;
  int precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  int visKm;
  int visMiles;
  int uv;
  double gustMph;
  double gustKph;

  Current(
      this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph);

  factory Current.fromJson(Map<String, dynamic> currentData) {
    return Current(
        currentData['lastUpdatedEpoch'],
        currentData['lastUpdated'],
        currentData['tempC'],
        currentData['tempF'],
        currentData['isDay'],
        Condition.fromJson(currentData['condition']),
        currentData['windMph'],
        currentData['windKph'],
        currentData['windDegree'],
        currentData['windDir'],
        currentData['pressureMb'],
        currentData['pressureIn'],
        currentData['precipMm'],
        currentData['precipIn'],
        currentData['humidity'],
        currentData['cloud'],
        currentData['feelslikeC'],
        currentData['feelslikeF'],
        currentData['visKm'],
        currentData['visMiles'],
        currentData['uv'],
        currentData['gustMph'],
        currentData['gustKph']);
  }
}

class Condition {
  String text;
  String icon;
  int code;
  Condition(this.text, this.icon, this.code);

  factory Condition.fromJson(Map<String, dynamic> conditionData) {
    return Condition(
        conditionData['text'], conditionData['icon'], conditionData['code']);
  }
}
