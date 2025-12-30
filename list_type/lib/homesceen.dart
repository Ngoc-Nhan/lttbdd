import 'package:flutter/material.dart';
import 'ListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose List Type')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListScreen(useLazy: false),
                  ),
                );
              },
              child: const Text('Column (1,000,000 items)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListScreen(useLazy: true),
                  ),
                );
              },
              child: const Text('ListView.builder (1,000,0000 items)'),
            ),
          ],
        ),
      ),
    );
  }
}
