import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'screen_todo.dart';
import 'screen_memo.dart';
import 'screen_comment.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JDSs Coffeee charger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JDSs Coffeee charger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String homepageURL = 'https://www.buymeacoffee.com/dongsub_joung';

  void popUpCoffee() {
    final String url = homepageURL;
    js.context.callMethod('open', [url]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Plz! Buy Some Coffeeee for him!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            Center(
              child: Image.asset('assets/images/main.jpeg'),
            ),
            GestureDetector(
  onTap: () {
    // Add your navigation or link handling logic here
    // For example, you can navigate to another screen using Navigator
    // Navigator.push(context, MaterialPageRoute(builder: (context) => YourNextScreen()));
    
    // Or you can open a URL using launch from the url_launcher package
    // Make sure to add url_launcher to your pubspec.yaml file
    // Example:
    launch('https://dongsub.ngrok.io');
  },
  child: Center(
    child: Text(
      'Rusty & DevSecOps',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        decoration: TextDecoration.underline, // Add underline for better visual indication of the link
      ),
    ),
  ),
)
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenTodo()),
            );
          },
          child: Text('Todo List'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenMemo()),
            );
          },
          child: Text('Memo'),
        ),
         ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenComment()),
            );
          },
          child: Text('Comment'),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: popUpCoffee,
        child: const Icon(Icons.coffee),
      ),
    );
  }
}
