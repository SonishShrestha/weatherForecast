import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moru_intern/models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Weather> allWeather = [];

  Future<Weather> weatherResponse() async {
    Dio dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=928250315ded4a7f8b640619231607&q=London&aqi=no');
    final weatherDatas = Weather.fromJson(response.data);
    return weatherDatas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Forecast',
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ))),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('save'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey)),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: weatherResponse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.current.wind_dir);
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
