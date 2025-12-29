import 'package:flutter/material.dart';

class PwPage extends StatefulWidget {
  const PwPage({super.key});

  @override
  State<PwPage> createState() => _PwPageState();
}

class _PwPageState extends State<PwPage> {
  final TextEditingController _pwController = TextEditingController();
  bool _obscureText = true;
  String? _errorText;

  void _submit() {
    final pw = _pwController.text;

    setState(() {
      if (pw.isEmpty) {
        _errorText = 'Password không được để trống';
      } else if (pw.length < 6) {
        _errorText = 'Password phải ít nhất 6 ký tự';
      } else {
        _errorText = null;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Password hợp lệ 🎉')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PW Page')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pwController,
              obscureText: _obscureText,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Nhập mật khẩu',
                errorText: _errorText,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Xác nhận'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
