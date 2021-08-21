import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final client_1 = StreamChatClient('xm2ba9n8jt74', logLevel: Level.INFO);
  await client_1.connectUser(User(id: 'tutorial-flutter'),
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoieG0yYmE5bjhqdDc0In0.U1A03fPVvIDsaiaK2D6KD7f5fPsAitp6WqV5nT_4sdY');

  final channel_1 = client_1.channel('messaging', id: 'flutterdevs');

  channel_1.watch();

  runApp(MyApp(client: client_1, channel: channel_1));
}

class MyApp extends StatelessWidget {A
  const MyApp({
    Key? key,
    required this.client,
    required this.channel,
  }) : super(key: key);

  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return StreamChat(client: client, child: child);
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChannelHeader(
          title: Text('Chataru!'),
        ),
        body: Column(
          children: [
            Expanded(
              child: MessageListView(),
            ),
            MessageInput(),
          ],
        ));
  }
}
