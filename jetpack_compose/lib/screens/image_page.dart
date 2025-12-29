import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(
                'https://butbi.hocmai.vn/wp-content/uploads/2023/07/diem-chuan-danh-gia-nang-luc-2023-dai-hoc-giao-thong-van-tai-tp-hcm.jpg',
              ),
              width: 400,
              height: 200,
            ),

            Text('This is an image loaded from the network.'),
            SizedBox(height: 20),
            Image(image: AssetImage('assets/UTH.jpg'), width: 500, height: 200),
            Text('This is an image loaded from assets.'),
          ],
        ),
      ),
    );
  }
}
