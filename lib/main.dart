import 'package:flutter/material.dart';
import 'package:helloworld/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "${counter.getCount()}",
                style: TextStyle(color: Colors.blue, fontSize: 50),
              ),
              RaisedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Text("Count"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NextPage(number: counter.getCount()),
                    ),
                  );
                },
                child: Text("Next"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  NextPage({@required this.number});

  final int number;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$number",
          style: TextStyle(color: Colors.blueAccent, fontSize: 60)),
    );
  }
}
