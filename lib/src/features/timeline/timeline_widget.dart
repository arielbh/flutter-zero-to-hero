import 'package:alt_twitter/main.dart';
import 'package:alt_twitter/src/common/message.dart';
import 'package:alt_twitter/src/features/timeline/message_in_timeline_widget.dart';
import 'package:alt_twitter/src/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late List<Message> _messages = [];

  @override
  void initState() 
  {
    super.initState();
    _messages = locator<MessageService>().state;
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocListener<MessageService, List<Message>>(
            listener: (context, state) {
              _messages.insertAll(0, state);
              for (var element in state) {
                _listKey.currentState!.insertItem(0);
              }
            },
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _messages.length,
              itemBuilder: (context, index, animation) => SlideTransition(
                  position: CurvedAnimation(
                    curve: Curves.easeOut,
                    parent: animation,
                  ).drive((Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset(0, 0),
                  ))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: MessageInTimelineWidget(message: _messages[index]),
                  )),
            )),
      ),
    );
  }
}
