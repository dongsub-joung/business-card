import 'package:flutter/material.dart';
import 'dart:js' as js;


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
        useMaterial3: true,
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

  void popUpCoffee(){
    final String url= homepageURL;
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
              'Plz! Buy Some Coffeeee at him!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30, 
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: popUpCoffee,
        child: const Icon(Icons.add),
      ),
    );
  }
}
