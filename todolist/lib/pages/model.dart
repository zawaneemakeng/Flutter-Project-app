enum ChatMessageType { user, botbot }

class ChatMessage {
  final String text;
  final ChatMessageType chatMessageType;
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });
}
