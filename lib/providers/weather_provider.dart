import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  List searchData = [];
  TextEditingController locationSearchController = TextEditingController();
}
