import 'package:flutter/material.dart';

class WeatherNow extends StatelessWidget {
  final String name;
  final String data;
  final IconData? icons;
  const WeatherNow(
      {super.key, required this.name, required this.data, this.icons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(data)
          ],
        ),
      ],
    );
  }
}
