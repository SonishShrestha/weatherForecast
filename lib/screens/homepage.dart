import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField()),
              ElevatedButton(onPressed: () {}, child: Text('save'))
            ],
          )
        ],
      ),
    );
  }
}
