import 'package:flutter/material.dart';

class ProviderExamplePage extends StatefulWidget {
  ProviderExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProviderExamplePageState createState() => _ProviderExamplePageState();
}

class _ProviderExamplePageState extends State<ProviderExamplePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.display1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
