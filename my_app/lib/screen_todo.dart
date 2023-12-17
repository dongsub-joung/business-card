import 'package:flutter/material.dart';

class ScreenTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to Screen A when the button   is pressed
            Navigator.pop(context);
          },
          child: Text('Go back to Screen A'),
        ),
      ),
    );
  }
}
