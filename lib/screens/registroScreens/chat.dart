import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, Will",
        messageType: "receiver",
        time: DateTime.now()),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        time: DateTime.now()),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        time: DateTime.now()),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        time: DateTime.now()),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        time: DateTime.now()),
  ];

  TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          messageContent: _messageController.text,
          messageType: "sender",
          time: DateTime.now(),
        ));
        _messageController.clear();
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 100,
            width: 400,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Add your back button functionality here
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 43, 0, 10),
                  child: Image.asset(
                    'assets/images/User.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 43, 0, 0),
                  child: Column(
                    children: const [
                      Text(
                        'Sophia',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Text(
                          'online',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(112, 28, 0, 0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final message = messages[index];
                      final formattedTime =
                          DateFormat.jm().format(message.time);
                      return Column(
                        crossAxisAlignment: message.messageType == "receiver"
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 5),
                            child: Align(
                              alignment: message.messageType == "receiver"
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: message.messageType == "receiver"
                                      ? Colors.grey.shade200
                                      : Colors.blue[200],
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Text(message.messageContent,
                                    style: const TextStyle(fontSize: 15)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    message.messageType == "receiver" ? 20 : 0,
                                right:
                                    message.messageType == "sender" ? 20 : 0),
                            child: Text(
                              formattedTime,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: messages.length,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: _sendMessage,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  DateTime time; // Add this line
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.time});
}
