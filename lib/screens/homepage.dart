import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          )
        ],
      ),
    );
  }
}
