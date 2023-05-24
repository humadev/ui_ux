part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class GetMessages extends MessageEvent {
  final Contact contact;

  GetMessages(this.contact) : super();
}
