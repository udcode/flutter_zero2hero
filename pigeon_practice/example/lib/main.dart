// lib/main.dart
import 'package:flutter/material.dart';
import 'package:pigeon_practice/pigeon_practice.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatApi _api = ChatApi();
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _setupMessageCallback();
  }

  void _setupMessageCallback() {
    ChatCallback.setUp(ChatCallbackImplementation(
      handleNewMessage: (Message message) {
        setState(() {
          _messages.add(message);
        });
      },
      handleMessageStatusChanged: (String messageId, String status) {
        // setState(() {
        //   final messageIndex = _messages.indexWhere((m) => m.id == messageId);
        //   if (messageIndex != -1) {
        //     final message = _messages[messageIndex];
        //     message.status = status;
        //   }
        // });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Message status changed: $messageId -> $status'),
        ));
      },
    ));
  }

  Future<void> _loadMessages() async {
    try {
      final messages = await _api.getMessages();
      setState(() {
        _messages.addAll(messages);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading messages: $e')),
        );
      }
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final message = Message()
      ..id = DateTime.now().millisecondsSinceEpoch.toString()
      ..content = _controller.text
      ..sender = 'User'
      ..timestamp = DateTime.now().millisecondsSinceEpoch
      ..status = 'sending';

    setState(() {
      _messages.add(message);
    });

    try {
      await _api.sendMessage(message);
      await _api.saveMessage(message);
      _controller.clear();
    } catch (e) {
      if (mounted) {
        setState(() {
          message.status = 'error';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending message: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: _showContacts,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return MessageBubble(message: message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showContacts() async {
    try {
      final contacts = await _api.getContacts();
      if (!mounted) return;

      showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              title: Text(contact.name ?? ''),
              subtitle: Text(contact.phoneNumber ?? ''),
              onTap: () {
                Navigator.pop(context);
                // כאן אפשר להוסיף לוגיקה של התחלת צ'אט עם איש הקשר
              },
            );
          },
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading contacts: $e')),
      );
    }
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: message.sender == 'User'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.sender == 'User' ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.content ?? '',
                style: TextStyle(
                  color: message.sender == 'User' ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatTimestamp(message.timestamp),
                    style: TextStyle(
                      fontSize: 12,
                      color: message.sender == 'User'
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                  if (message.sender == 'User') ...[
                    const SizedBox(width: 4),
                    _buildStatusIcon(message.status),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(int? timestamp) {
    if (timestamp == null) return '';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildStatusIcon(String? status) {
    switch (status) {
      case 'sending':
        return const Icon(Icons.access_time, size: 12, color: Colors.white70);
      case 'sent':
        return const Icon(Icons.check, size: 12, color: Colors.white70);
      case 'delivered':
        return const Icon(Icons.done_all, size: 12, color: Colors.white70);
      case 'read':
        return const Icon(Icons.done_all, size: 12, color: Colors.lightBlueAccent);
      case 'error':
        return const Icon(Icons.error_outline, size: 12, color: Colors.red);
      default:
        return const SizedBox.shrink();
    }
  }
}

// המימוש של ChatCallbackImplementation
class ChatCallbackImplementation extends ChatCallback {
  final void Function(Message) handleNewMessage;
  final void Function(String, String) handleMessageStatusChanged;

  ChatCallbackImplementation({
    required this.handleNewMessage,
    required this.handleMessageStatusChanged,
  });

  @override
  void onNewMessage(Message message) {
    this.handleNewMessage(message);
  }

  @override
  void onMessageStatusChanged(String messageId, String status) {
    this.handleMessageStatusChanged(messageId, status);
  }
}