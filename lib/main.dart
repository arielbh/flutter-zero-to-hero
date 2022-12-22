import 'package:alt_twitter/src/features/compose/compose.dart';
import 'package:alt_twitter/src/features/timeline/timeline_widget.dart';
import 'package:alt_twitter/src/features/trends/trends.dart';
import 'package:alt_twitter/src/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Layout(title: 'Flutter Demo Home Page'),
    );
  }
}

class Layout extends StatelessWidget {
  const Layout({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Menu(),
              )),
              Expanded(
                  child: Column(
                children: [
                  Compose(),
                  const SizedBox(height: 12.0),
                  Expanded(child: TimelineWidget()),
                ],
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Trends(),
              )),
            ],
          ),
        ));
  }
}
