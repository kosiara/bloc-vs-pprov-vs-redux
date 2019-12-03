import 'package:flutter/material.dart';
import 'package:flutter_arch/arch/provider_examp.dart';

class ArchApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architecture Comparison Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderExamplePage(title: 'Architecture Comparison Demo'),
    );
  }
}


