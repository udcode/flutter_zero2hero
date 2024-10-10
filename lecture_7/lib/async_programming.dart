import 'dart:async';
import 'package:http/http.dart' as http;

class CancellationToken {
  final StreamController<void> _controller = StreamController<void>();

  Stream<void> get cancelStream => _controller.stream;

  void cancel() {
    if (!_controller.isClosed) {
      _controller.add(null);
      _controller.close();
    }
  }
}

Future<void> fetchDataWithRealCancel(CancellationToken token) async {
  try {
    final responseFuture = http.get(
      Uri.parse('https://reqres.in/api/users?page=2'),
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'},
    );

    token.cancelStream.listen((_) {
      throw 'Operation canceled';
    });

    final response = await responseFuture;
    await Future.delayed(Duration(seconds: 2));
    if (response.statusCode == 200) {
      print('Data: ${response.body}');
    } else {
      print('Failed to load data');
    }
  } catch (e) {
    print('Error or cancellation: $e');
  }
}

void executeOperation() {
  final token = CancellationToken();
  fetchDataWithRealCancel(token);

  // ביטול הפעולה לאחר זמן קצר לדוגמה
  Future.delayed(Duration(seconds: 1), () {
    token.cancel();
    print('Operation canceled by user');
  });
}