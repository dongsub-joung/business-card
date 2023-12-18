import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alert Dialog'),
        ),
        body: Test(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            _showdialog(context);
          },
          child: Text('push')),
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('저녁'),
        content: Text('밥 먹을러 갈래?'),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('가자')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('싫어')),
        ],
      ),
    );
  }
}
