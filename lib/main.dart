import 'package:flutter/material.dart';
import './widgets/user-transactions.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ));
  }
}
