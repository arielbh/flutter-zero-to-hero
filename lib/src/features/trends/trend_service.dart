import 'dart:async';
import 'dart:math';

import 'package:alt_twitter/src/features/trends/trend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendService extends Cubit<List<Trend>> {
  final _random = Random();
  TrendService()
      : super([
          Trend("Flutter", 34534, category: "Technology"),
          Trend("Lumen", 1100000),
          Trend("Angular", 14, category: "Technology"),
          Trend("Argentina", 6000),
          Trend("Messi vs Ronaldo", 9090945, category: "Sport"),
        ]);
  void start() {
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      final index = _random.nextInt(state.length);
      final list = [...state];
      list[index] = list[index].copyWith(numberOfMessages: _random.nextInt(1000000));
      emit(list);
    });
  }
}
