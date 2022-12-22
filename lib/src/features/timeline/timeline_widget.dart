import 'package:alt_twitter/src/common/author.dart';
import 'package:alt_twitter/src/common/message.dart';
import 'package:alt_twitter/src/features/timeline/message_in_timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimelineWidget extends StatelessWidget {
  final List<Message> _messages = [
    Message(
      "💙 Are you a Flutter Developer? 💙",
      65,
      DateTime.now().subtract(const Duration(minutes: 10)),
      Author("1", "_Mo_Malaka_", "Mo Malaka 💙", "images/mo.png"),
    ),
    Message(
      '''Drinking game for web devs: 
        (1) Think of a noun
        (2) Google "<noun>.js"
        (3) If a library with that name exists - drink''',
      856,
      DateTime.now().subtract(const Duration(hours: 1)),
      Author("2", "ironshay", "Shay Friedman", "images/shay.jpeg"),
    ),
  ];
  TimelineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: MessageInTimelineWidget(message: _messages[index]),
          ),
        ),
      ),
    );
  }
}
