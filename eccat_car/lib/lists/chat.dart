import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController _controller = TextEditingController();
  List<Message> _messages = [
    Message(text: 'Hello, how can I assist you?', isUser: false)
  ];

  Map<String, String> _answers = {
    'hi': 'Hi there!',
    'how are you': 'I\'m doing fine, thank you for asking.',
    'what is your name': 'My name is Chatbot.',
    'bye': 'Goodbye, have a nice day!',
  };

  void _handleSubmitted(String message) {
    _controller.clear();
    setState(() {
      _messages.insert(0, Message(text: message, isUser: true));
      String response =
          _answers[message.toLowerCase()] ?? 'Sorry, I don\'t understand.';
      _messages.insert(0, Message(text: response, isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColorDark,
        title: const Text(
          "Help",
          style: headline1,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, index) => _buildMessage(_messages[index]),
            ),
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextField(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: message.isUser ? Colors.blueAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Type your message...',
        contentPadding: EdgeInsets.all(10),
      ),
      onSubmitted: _handleSubmitted,
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
