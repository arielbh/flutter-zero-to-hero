import 'package:alt_twitter/src/features/trends/trend.dart';
import 'package:alt_twitter/src/features/trends/trend_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Trends extends StatelessWidget {
  const Trends({Key? key}) : super(key: key);

  String _formatNumber(int number) => NumberFormat.compact().format(number);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Trends for you", style: Theme.of(context).textTheme.headline6),
            Expanded(
              child: BlocBuilder<TrendService, List<Trend>>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${state[index].category ?? ""} Trending", style: Theme.of(context).textTheme.bodyText1),
                          Text(state[index].title, style: Theme.of(context).textTheme.headline5),
                          Text("${_formatNumber(state[index].numberOfMessages)} Messages",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
