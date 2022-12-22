import 'package:alt_twitter/main.dart';
import 'package:alt_twitter/src/common/author.dart';
import 'package:alt_twitter/src/common/message.dart';
import 'package:alt_twitter/src/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Compose extends StatefulWidget {
  final Author author;
  const Compose({Key? key, required this.author}) : super(key: key);

  @override
  _ComposeState createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.author.imageUrl),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 140,
                      maxLines: null,
                      controller: _controller,
                      decoration: const InputDecoration.collapsed(hintText: 'What' 's happening?'),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    locator<MessageService>().send(_controller.text);
                  }, child: Text("Send")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
