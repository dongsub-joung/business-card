import 'package:flutter/material.dart';

class ScreenTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<int> listing = <int>[1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
