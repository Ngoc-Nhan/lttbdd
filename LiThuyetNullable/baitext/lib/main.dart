import 'package:flutter/material.dart';

class NullableExampleScreen extends StatefulWidget {
  const NullableExampleScreen({super.key});

  @override
  State<NullableExampleScreen> createState() => _NullableExampleScreenState();
}

class _NullableExampleScreenState extends State<NullableExampleScreen> {
  String? name; // nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nullable Example")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nhập tên của bạn:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ví dụ: Nhàn",
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              name == null || name!.isEmpty
                  ? "Bạn chưa nhập tên"
                  : "Xin chào $name",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
