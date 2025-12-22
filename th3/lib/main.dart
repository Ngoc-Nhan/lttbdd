import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedPayment;

  // ===== WIDGET PAYMENT ITEM (OOP - TRỪU TƯỢNG HÓA) =====
  Widget paymentItem({
    required String id,
    required String title,
    required String image,
  }) {
    final bool isSelected = selectedPayment == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = isSelected ? null : id;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            // color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 98, 93, 93).withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_on : Icons.radio_button_off,
              color: Colors.blue,
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                // color: isSelected ? Colors.blue : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            Image.asset(image, width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  // ===== ICON / LOGO PHÍA TRÊN =====
  Widget selectedPaymentView() {
    if (selectedPayment == null) {
      return const Icon(Icons.add_card, size: 70, color: Colors.grey);
    }

    String image;
    switch (selectedPayment) {
      case 'paypal':
        image = 'assets/images/paypal.png';
        break;
      case 'ggpay':
        image = 'assets/images/ggpay.png';
        break;
      default:
        image = 'assets/images/applepay.png';
    }

    return Image.asset(image, width: 100, height: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Payment Method'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Center(child: selectedPaymentView()),
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 24),

            // ===== PAYMENT LIST =====
            paymentItem(
              id: 'paypal',
              title: 'PayPal',
              image: 'assets/images/paypal.png',
            ),
            paymentItem(
              id: 'ggpay',
              title: 'Google Pay',
              image: 'assets/images/ggpay.png',
            ),
            paymentItem(
              id: 'applepay',
              title: 'Apple Pay',
              image: 'assets/images/applepay.png',
            ),

            const SizedBox(height: 24),

            // ===== CONTINUE BUTTON =====
            if (selectedPayment != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // xử lý tiếp theo
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
