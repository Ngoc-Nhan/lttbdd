import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/jetpack.png', width: 150, height: 150),
            SizedBox(height: 34),
            Column(
              children: [
                Text(
                  ' Jetpack Compose',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Jetpack Compose is Android’s modern toolkit for building native Android appications using a declarative programming approach.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
            // Navigate to the next screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,

            minimumSize: Size(double.infinity, 50),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(16),
            // ),
          ),
          child: Text('Get Started', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
