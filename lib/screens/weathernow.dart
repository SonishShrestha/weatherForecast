import 'package:flutter/material.dart';

class WeatherNow extends StatelessWidget {
  String name;
  String data;
  IconData? icons;
  WeatherNow({super.key, required this.name, required this.data, this.icons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Text(data)
          ],
        ),
      ],
    );
  }
}
