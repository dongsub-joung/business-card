import 'package:flutter/material.dart';

class ScreenMemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> listing = <String>[
      'DevSecOps'
      , 'rust diesel'
      , 'rust Actix Web '
      , 'k8s'
    ];

    final len= listing.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo LIST'),
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
