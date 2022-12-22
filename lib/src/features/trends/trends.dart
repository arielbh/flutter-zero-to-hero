import 'package:alt_twitter/src/features/trends/trend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Trends extends StatelessWidget {
  final List<Trend> _trends = [
    Trend("Flutter", 34534, category: "Technology"),
    Trend("Lumen", 1100000),
    Trend("Angular", 14, category: "Technology"),
    Trend("Argentina", 6000),
    Trend("Messi vs Ronaldo", 9090945, category: "Sport"),
  ];
  Trends({Key? key}) : super(key: key);

  String _formatNumber(int number) => NumberFormat.compact().format(number);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Trends for you", style: Theme.of(context).textTheme.headline6),
            Expanded(
              child: ListView.builder(
                itemCount: _trends.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${_trends[index].category ?? ""} Trending"),
                    Text(_trends[index].title, style: Theme.of(context).textTheme.headline5),
                    Text("${_formatNumber(_trends[index].numberOfMessages)} Messages"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
