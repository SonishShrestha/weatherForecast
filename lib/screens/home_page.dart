import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:moru_intern/models/weather_model.dart';
import 'package:moru_intern/screens/front_page.dart';
import 'package:moru_intern/screens/weather_now.dart';

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
        'http://api.weatherapi.com/v1/current.json?key=928250315ded4a7f8b640619231607&q=$locationName&aqi=no');
    final weatherDatas = Weather.fromJson(response.data);
    return weatherDatas;
  }

  List searchData = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  return const FrontPage();
                },
              ));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 99, 96, 96))),
            child: const Text('Help Screen'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Current Location';
                              } else {
                                return null;
                              }
                            },
                            controller: locationSearchController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 100,
                        child: DropdownSearch(
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: "Location")),
                          items: searchData.map((e) {
                            return e;
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              locationSearchController.text = newValue;
                            });
                          },
                        ),
                      ),
                      // DropdownButton(
                      //   value: dropdownvalue,
                      //   icon: const Icon(Icons.arrow_downward),
                      //   items: searchData.map((e) {
                      //     return DropdownMenuItem(
                      //         value: e.toString(), child: Text(e));
                      //   }).toList(),
                      //   onChanged: (String? newvalue) {
                      //     setState(() {
                      //       dropdownvalue = newvalue!;
                      //     });
                      //   },
                      // ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          data = locationSearchController.text;
                          if (searchData.contains(data)) {
                          } else {
                            searchData.add(data!);
                          }
                          if (formKey.currentState!.validate()) {}

                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey)),
                        child: locationSearchController.text.isEmpty
                            ? const Text('Save')
                            : const Text('Update'),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder<Weather>(
                future: weatherResponse('$data'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      color: Colors.grey,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.location.country,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Today , ${snapshot.data!.location.localtime}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Image.network(
                              "https:${snapshot.data!.current.condition.icon}",
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              '${snapshot.data!.current.temp_c.toString()}°',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 40),
                            ),
                            Text(
                              snapshot.data!.current.condition.text,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<Weather>(
                future: weatherResponse('$data'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const Text(
                          'Weather Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WeatherNow(
                              name: 'Wind',
                              data:
                                  '${snapshot.data!.current.wind_kph.toString()} km/h',
                              icons: Icons.wind_power_outlined,
                            ),
                            WeatherNow(
                              name: 'Wind',
                              data:
                                  '${snapshot.data!.current.wind_mph.toString()} mp/h',
                              icons: Icons.wind_power_outlined,
                            ),
                            WeatherNow(
                              name: 'Humidity',
                              data: '${snapshot.data!.current.humidity}%',
                              icons: Icons.water_drop,
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WeatherNow(
                              name: 'Latitude',
                              data: '${snapshot.data!.location.lat}',
                            ),
                            WeatherNow(
                              name: 'Longitute',
                              data: '${snapshot.data!.location.lon}',
                            ),
                            WeatherNow(
                              name: 'Wind Degree',
                              data: '${snapshot.data!.current.wind_degree}°',
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text('Location Not Found');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
