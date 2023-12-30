import 'package:flutter/material.dart';

class ScreenTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> listing = <String>[
      'Spring project in login'
      , 'Image loader in WASM'
      , 'Write the todo code(diesel + postgresql)'
      , 'cargo publish todo app'
    ];

    final len= listing.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('${listing[index]}')),
              childCount: len,
            ),
          ),
        ],
      ),
    );
  }
}
