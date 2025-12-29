import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  Widget buildBox({bool highlighted = false}) {
    return Container(
      width: 70,
      height: 60,
      decoration: BoxDecoration(
        color: highlighted ? Colors.blue : Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget buildColumnBox() {
    return Container(
      height: 240,
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 236, 239), // 🔵 Nền bao ngoài
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox(),
          const SizedBox(height: 16),
          buildBox(highlighted: true),
          const SizedBox(height: 16),
          buildBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Layout')),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildColumnBox(),
              buildColumnBox(),
              buildColumnBox(),
              buildColumnBox(),
            ],
            // ),
          ),
        ),

        // padding: const EdgeInsets.all(10.0),
        // child: Expanded(
      ),
    );
  }
}
