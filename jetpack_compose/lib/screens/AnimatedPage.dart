import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  bool showFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Page')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              showFirst = !showFirst;
            });
          },
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: showFirst ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'First',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: showFirst ? 0.0 : 1.0,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Second',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
