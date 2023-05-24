import 'package:ui_ux/models/message.dart';

class Contact {
  final String id;
  final String name;
  final String lastChat;
  final String lastChatTime;
  final String photo;
  List<Message> messages = [];

  Contact(this.id, this.name, this.lastChat, this.lastChatTime, this.photo);

  @override
  String toString() {
    return '$name, $lastChat';
  }
}
