import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final bool useLazy;

  const ListScreen({super.key, required this.useLazy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(useLazy ? 'ListView.builder' : 'Column')),
      body: useLazy ? _lazyList() : _columnList(),
    );
  }

  //  Column – sẽ lag/crash
  Widget _columnList() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          10000000,
          (index) => ListTile(title: Text('Item $index')),
        ),
      ),
    );
  }

  //  Lazy list
  Widget _lazyList() {
    return ListView.builder(
      itemCount: 100000,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            title: Text('$index'),
            subtitle: const Text(
              'The only way to do great work is to love what you do',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    );
  }
}
