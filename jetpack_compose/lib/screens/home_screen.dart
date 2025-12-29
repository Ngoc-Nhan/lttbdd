import 'package:flutter/material.dart';
import 'text_page.dart';
import 'image_page.dart';
import 'input_screen.dart';
import 'PW_page.dart';
import 'ColumnPage.dart';
import 'RowPage.dart';
import 'AnimatedPage.dart';
import 'CrossfadePage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //data

  static final sections = [
    // Define sections and items here
    {
      'title': 'Display',
      'items': [
        {
          'title': 'Text',
          'subtitle': 'Displays text',
          'page': const TextPage(),
        },
        {
          'title': 'Image',
          'subtitle': 'Displays an image',
          'page': const ImagePage(),
        },
      ],
    },
    {
      'title': 'Input',
      'items': [
        {
          'title': 'TextField',
          'subtitle': 'Input field for text',
          'page': InputPage(),
        },
        {
          'title': 'PasswordField',
          'subtitle': 'Input field for password',
          'page': const PwPage(),
        },
      ],
    },
    {
      'title': 'Layout',
      'items': [
        {
          'title': 'Column',
          'subtitle': 'Arranges elements vertically',
          'page': const ColumnPage(),
        },
        {
          'title': 'Row',
          'subtitle': 'Arranges elements horizontally',
          'page': const RowPage(),
        },
      ],
    },
    {
      'title': 'Animation',
      'items': [
        {
          'title': 'AnimatedOpacity',
          'subtitle': 'Show or hide items with animation',
          'page': const AnimatedPage(),
        },
        // {
        //   ''
        // },
      ],
    },
  ];

  //item card
  Widget buildItemCard(Map<String, dynamic> item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item['page'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item['page']),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Page not implemented yet')),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 107, 179, 223),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(item['title']),
              subtitle: Text(item['subtitle']),
              // trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  //section widget

  Widget buildSection(Map<String, dynamic> section, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            section['title'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...section['items']
            .map<Widget>(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildItemCard(item, context),
              ),
            )
            .toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jetpack Compose Components'),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: sections
              .map<Widget>((section) => buildSection(section, context))
              .toList(),
        ),
      ),
    );
  }
}
