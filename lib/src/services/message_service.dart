import 'package:alt_twitter/src/common/author.dart';
import 'package:alt_twitter/src/common/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageService extends Cubit<List<Message>> {
  final Author _loggedAuthor;
  MessageService({required Author loggedAuthor})
      : _loggedAuthor = loggedAuthor,
        super([
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
        ]);

  void send(String text) {
    emit([Message(text, 0, DateTime.now(), _loggedAuthor), ...state]);
  }
}
