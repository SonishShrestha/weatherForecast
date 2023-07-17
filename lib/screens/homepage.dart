import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moru_intern/models/weather_model.dart';
import 'package:moru_intern/screens/frontPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;
  TextEditingController locationSearchController = TextEditingController();
  Future<Weather> weatherResponse(String locationName) async {
    Dio dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=928250315ded4a7f8b640619231607&q=${locationName}&aqi=no');
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
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return FrontPage();
                  },
                ));
              },
              child: Text('Help Screen'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: locationSearchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      data = locationSearchController.text;
                      setState(() {});
                    },
                    child: const Text('save'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<Weather>(
              future: weatherResponse('$data'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Image.network(
                        snapshot.data!.current.condition.icon,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                      Text(snapshot.data!.current.temp_c.toString()),
                      Text(snapshot.data!.current.condition.text),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
