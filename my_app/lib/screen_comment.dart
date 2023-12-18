import 'package:flutter/material.dart';

class ScreenComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> listing = <String>[
      'Build My website(nginx + Front)'
      , 'Write the todo code(diesel + postgresql)'
      , 'cargo publish todo app'
    ];

    final len= listing.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
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

       floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
