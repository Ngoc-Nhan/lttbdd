import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});

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

  Widget buildRowBox() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 236, 239), // 🔵 Nền bao ngoài
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox(),
          const SizedBox(width: 16),
          buildBox(highlighted: true),
          const SizedBox(width: 16),
          buildBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Layout')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRowBox(),
            buildRowBox(),
            buildRowBox(),
            buildRowBox(),
          ],
        ),
      ),
    );
  }
}
