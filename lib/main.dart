import 'package:flutter/material.dart';
import './widgets/user-transactions.dart';

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
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    child: Card(
                      child: Text('chart'),
                      elevation: 5,
                    )),
                UserTransactions(),
              ],
            ),
          ),
        ));
  }
}
