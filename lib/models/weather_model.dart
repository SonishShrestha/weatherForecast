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
  String tz_id;
  int localtime_epoch;
  String localtime;

  Location(this.name, this.region, this.country, this.lat, this.lon, this.tz_id,
      this.localtime_epoch, this.localtime);

  factory Location.fromJson(Map<String, dynamic> locationData) {
    return Location(
        locationData['name'],
        locationData['region'],
        locationData['country'],
        locationData['lat'],
        locationData['lat'],
        locationData['tz_id'],
        locationData['localtime_epoch'],
        locationData['localtime']);
  }
}

class Current {
  int last_updated_epoch;
  String last_updated;
  double temp_c;
  double temp_f;
  int is_day;
  Condition condition;
  double wind_mph;
  double wind_kph;
  int wind_degree;
  String wind_dir;
  double pressure_mb;
  double pressure_in;
  double precip_mm;
  double precip_in;
  int humidity;
  int? cloud;
  double feelslike_c;
  double feelslike_f;
  double vis_km;
  double vis_miles;
  double uv;
  double gust_mph;
  double gust_kph;

  Current(
      this.last_updated_epoch,
      this.last_updated,
      this.temp_c,
      this.temp_f,
      this.is_day,
      this.condition,
      this.wind_mph,
      this.wind_kph,
      this.wind_degree,
      this.wind_dir,
      this.pressure_mb,
      this.pressure_in,
      this.precip_mm,
      this.precip_in,
      this.humidity,
      this.cloud,
      this.feelslike_c,
      this.feelslike_f,
      this.vis_km,
      this.vis_miles,
      this.uv,
      this.gust_mph,
      this.gust_kph);

  factory Current.fromJson(Map<String, dynamic> currentData) {
    return Current(
        currentData['last_updated_epoch'],
        currentData['last_updated'],
        currentData['temp_c'],
        currentData['temp_f'],
        currentData['is_day'],
        Condition.fromJson(currentData['condition']),
        currentData['wind_mph'],
        currentData['wind_kph'],
        currentData['wind_degree'],
        currentData['wind_dir'],
        currentData['pressure_mb'],
        currentData['pressure_in'],
        currentData['precip_mm'],
        currentData['precip_in'],
        currentData['humidity'],
        currentData['cloud'],
        currentData['feelslike_c'],
        currentData['feelslike_f'],
        currentData['vis_km'],
        currentData['vis_miles'],
        currentData['uv'],
        currentData['gust_mph'],
        currentData['gust_kph']);
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
