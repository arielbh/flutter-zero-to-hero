import 'package:alt_twitter/main.dart';
import 'package:alt_twitter/src/common/author.dart';
import 'package:alt_twitter/src/features/compose/compose.dart';
import 'package:alt_twitter/src/features/timeline/timeline_widget.dart';
import 'package:alt_twitter/src/services/message_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Compose(
          author: locator<Author>(),
        ),
        const SizedBox(height: 12.0),
        const Expanded(
            child: TimelineWidget()),
      ],
    );
  }
}
