import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double num1 = 0;
  double num2 = 0;
  String operator = '';
  double result = 0;
  String message = '';

  void calculate() {
    setState(() {
      message = '';

      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            message = 'Không thể chia cho 0';
            result = 0;
          } else {
            result = num1 / num2;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thực hành 03'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text('Thực hành 03', style: TextStyle(fontSize: 18)),

            const SizedBox(height: 20),

            // Nhập số 1
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                num1 = double.tryParse(value) ?? 0;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập số thứ nhất',
              ),
            ),

            const SizedBox(height: 20),

            // Nút phép toán
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OperatorButton(
                  text: '+',
                  color: Colors.red,
                  onTap: () {
                    operator = '+';
                    calculate();
                  },
                ),
                OperatorButton(
                  text: '-',
                  color: Colors.orange,
                  onTap: () {
                    operator = '-';
                    calculate();
                  },
                ),
                OperatorButton(
                  text: '*',
                  color: Colors.purple,
                  onTap: () {
                    operator = '*';
                    calculate();
                  },
                ),
                OperatorButton(
                  text: '/',
                  color: Colors.black,
                  onTap: () {
                    operator = '/';
                    calculate();
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Nhập số 2
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                num2 = double.tryParse(value) ?? 0;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập số thứ hai',
              ),
            ),

            const SizedBox(height: 20),

            // Thông báo lỗi
            if (message.isNotEmpty)
              Text(
                message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),

            const SizedBox(height: 10),

            // Kết quả
            Text(
              'Kết quả: $result',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class OperatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const OperatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
