import 'package:alt_twitter/src/common/author.dart';
import 'package:alt_twitter/src/common/message.dart';
import 'package:alt_twitter/src/features/timeline/message_in_timeline_widget.dart';
import 'package:alt_twitter/src/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<MessageService, List<Message>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: MessageInTimelineWidget(message: state[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
