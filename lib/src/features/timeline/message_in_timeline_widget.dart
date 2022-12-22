import 'package:alt_twitter/src/common/message.dart';
import 'package:flutter/material.dart';

class MessageInTimelineWidget extends StatelessWidget {
  final Message message;
  const MessageInTimelineWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(message.author.imageUrl),
        ),
        const SizedBox(width: 12.0),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${message.author.name} @${message.author.userName}", style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 4),
            Text(message.content),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ComposeCommand(icon: Icons.chat_bubble_outline, number: 1),
                const ComposeCommand(icon: Icons.restart_alt, number: 1),
                ComposeCommand(icon: Icons.heart_broken, number: message.likes),
                const ComposeCommand(icon: Icons.share),
              ],
            )
          ],
        ))
      ],
    );
  }
}

class ComposeCommand extends StatelessWidget {
  final IconData icon;
  final int? number;
  const ComposeCommand({Key? key, required this.icon, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        if (number != null) ...[
          const SizedBox(width: 2),
          Text(number.toString()),
        ]
      ],
    );
  }
}
