import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {

  late WebSocketChannel channel;

  void connect(String url) {

    channel = WebSocketChannel.connect(
      Uri.parse(url),
    );
  }

  void listen(Function(dynamic) onData) {

    channel.stream.listen(onData);
  }

  void close() {
    channel.sink.close();
  }
}