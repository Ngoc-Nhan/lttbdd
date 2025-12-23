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

 ///ENCABSULATION (ĐÓNG GÓI)
/// - selectedPayment và payments được quản lý bên trong State
/// - bên ngoài KHÔNG truy cập trực tiếp

class _MyHomePageState extends State<MyHomePage> {
  PaymentMethod? selectedPayment;

  final List<PaymentMethod> payments = [Paypal(), GooglePay(), ApplePay()];

  ///  POLYMORPHISM (ĐA HÌNH) payments
  

  Widget paymentItem(PaymentMethod payment) {
    final bool isSelected = selectedPayment?.id == payment.id;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = isSelected ? null : payment;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
              payment.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            Image.asset(payment.image, width: 50, height: 50),
          ],
        ),
      ),
    );
  }

  ///  POLYMORPHISM
  /// - Không cần switch-case
  /// - Mỗi object tự cung cấp image của nó

  Widget selectedPaymentView() {
    if (selectedPayment == null) {
      return const Icon(Icons.add_card, size: 70, color: Colors.grey);
    }

    return Image.asset(selectedPayment!.image, width: 100, height: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(child: selectedPaymentView()),
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 24),

            ///  POLYMORPHISM
            /// - Duyệt danh sách PaymentMethod
            for (final payment in payments) paymentItem(payment),

            const SizedBox(height: 24),

            if (selectedPayment != null)
              ElevatedButton(onPressed: () {}, child: const Text('Continue')),
          ],
        ),
      ),
    );
  }
}

///  ABSTRACTION (TRỪU TƯỢNG)
/// - Định nghĩa CHUNG cho mọi phương thức thanh toán
/// - Không quan tâm chi tiết từng loại

abstract class PaymentMethod {
  String get id;
  String get title;
  String get image;
}

///  INHERITANCE (KẾ THỪA)
/// - Paypal kế thừa PaymentMethod

class Paypal extends PaymentMethod {
  @override
  String get id => 'paypal';

  @override
  String get title => 'PayPal';

  @override
  String get image => 'assets/images/paypal.png';
}

/// 👉 INHERITANCE
class GooglePay extends PaymentMethod {
  @override
  String get id => 'ggpay';

  @override
  String get title => 'Google Pay';

  @override
  String get image => 'assets/images/ggpay.png';
}

///  INHERITANCE
class ApplePay extends PaymentMethod {
  @override
  String get id => 'applepay';

  @override
  String get title => 'Apple Pay';

  @override
  String get image => 'assets/images/applepay.png';
}
