import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Page')),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              height: 1.5,
            ),
            children: const [
              TextSpan(text: "The "),
              TextSpan(
                text: "quick",
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: "Brown",
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // dòng 2
              TextSpan(text: "\nfox "),
              TextSpan(
                text: "jumps",
                style: TextStyle(
                  letterSpacing: 10, // tạo hiệu ứng j u m p s
                ),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: "over",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),

              // dòng 3
              TextSpan(text: "\n"),
              TextSpan(
                text: "the ",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              TextSpan(
                text: "lazy",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              TextSpan(text: " dog."),
            ],
          ),
        ),
      ),
    );
  }
}
