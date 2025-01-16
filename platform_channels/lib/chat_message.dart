import 'package:pigeon/pigeon.dart';

// הגדרת האפשרויות עבור הקוד שייווצר
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/pigeon.dart',
  kotlinOut: 'android/app/src/main/kotlin/com/udcode/platform/channels/platform_channels/ChatApi.kt',
  swiftOut: 'ios/Runner/ChatApi.swift',
))

// מאחר ש-Pigeon לא תומך ב-DateTime, נשתמש ב-int עבור timestamp
class Message {
  String? id;
  String? content;
  String? sender;
  int? timestamp;  // נשתמש ב-millisecondsSinceEpoch
  String? status;  // למשל: 'sent', 'delivered', 'read'
}

class Contact {
  String? id;
  String? name;
  String? phoneNumber;
}


@HostApi()
abstract class ChatApi {
  @async
  List<Message> getMessages();

  @async
  void sendMessage(Message message);

  @async
  List<Contact> getContacts();

  @async
  void saveMessage(Message message);
}

@FlutterApi()
abstract class ChatCallback {
  void onNewMessage(Message message);
  void onMessageStatusChanged(String messageId, String status);
}