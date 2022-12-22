import 'package:alt_twitter/src/common/author.dart';

class Message {
  final String content;
  final int likes;
  final DateTime time;
  final Author author;

  Message(this.content, this.likes, this.time, this.author);
}
