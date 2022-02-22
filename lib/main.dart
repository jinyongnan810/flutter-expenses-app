// used when using Platform.isIOS, not supported in web
// import 'dart:io';
import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transaction-form.dart';
import './widgets/transaction-list.dart';
import './models/transaction.dart';

void main() {
  // force portrait landscape
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

// MyApp should be seperate with MyHomePage to avoid unexpected error
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme lightTheme = ThemeData.light().textTheme;
    return MaterialApp(
        title: 'Personal Expenses',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            // set overall font family
            fontFamily: 'Quicksand',
            // set some part of text style
            textTheme: lightTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            // set app bar title style
            appBarTheme: AppBarTheme(
                textTheme: lightTheme.copyWith(
                    headline6: lightTheme.headline6?.copyWith(
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                        color: Colors.white)))),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  void startAddingTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext _) {
          return TransactionForm(_onSubmit);
        });
  }

  List<Transaction> transactions = [
    Transaction("1", "test1", 100, DateTime.parse("2021-06-27 00:01")),
    Transaction("2", "test2", 100, DateTime.parse("2021-06-28 00:01")),
    Transaction("3", "test3", 100, DateTime.parse("2021-06-29 00:01")),
    Transaction("4", "test4", 100, DateTime.parse("2021-06-30 00:01")),
    Transaction("5", "test5", 100, DateTime.parse("2021-07-04 00:01")),
  ];

  List<Transaction> get recentTransactions {
    DateTime now = DateTime.now();
    final aWeekAgo = DateTime(now.year, now.month, now.day - 6);
    return transactions.where((t) => t.date.isAfter(aWeekAgo)).toList();
  }

  bool showChart = false;

  void _onSubmit(title, amount, date) {
    String txId = 'id${this.transactions.length + 1}';
    setState(() {
      this.transactions.add(Transaction(txId, title, amount, date));
    });
  }

  void _onDelete(String id) {
    setState(() {
      // transactions = transactions.where((tx) => tx.id != id).toList();
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("didChangeAppLifecycleState state($state)");
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = true; //defaultTargetPlatform == TargetPlatform.iOS;
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appbar2 = AppBar(
      title: const Text('Personal Expenses'),
      actions: [
        IconButton(
            onPressed: () => startAddingTransactions(context),
            icon: Icon(Icons.add))
      ],
    );
    final PreferredSizeWidget appBar = appbar2;
    final chartSmall = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(recentTransactions));
    final chartBig = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: Chart(recentTransactions));
    final txList = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(transactions, _onDelete));
    final switchShowChart = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Show Chart"),
        Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: showChart,
            onChanged: (val) {
              setState(() {
                showChart = val;
              });
            })
      ],
    );
    final body = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          if (isLandscape) switchShowChart,
          if (isLandscape && showChart) chartBig,
          if (isLandscape && !showChart) txList,
          if (!isLandscape) chartSmall,
          if (!isLandscape) txList,
        ],
      ),
    ));
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isIOS
          // Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => startAddingTransactions(context),
            ),
    );
  }
}
