import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
          ),
          body: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('chart'),
                    elevation: 5,
                  )),
              Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('transactions'),
                    elevation: 5,
                  ))
            ],
          ),
        ));
  }
}
