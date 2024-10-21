import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'state.dart';

class RemoteFetchCubit extends Cubit<RemoteFetchState> {
  RemoteFetchCubit() : super(RemoteFetchState().init());



  Future<void> fetchDataWithTimeout() async {
    emit(state.clone());
    try {
      final response = await http
          .get(
        Uri.parse('https://reqres.in/api/users?page=2'),
        headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'},
      )
          .timeout(Duration(seconds: 5),onTimeout: () {
        throw 'Request timed out';
      });

      if (response.statusCode == 200) {
        print('Data: ${response.body}');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Request timed out or error occurred: $e');
    }
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=2'),
      headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'},
    );
    if (response.statusCode == 200) {
      print('Data: ${response.body}');
    } else {
      print('Failed to load data');
    }
  }

  Future<void> postData() async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/users'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_TOKEN_HERE',
      },

      body: '{"name": "morpheus", "job": "leader"}',
    );
    if (response.statusCode == 201) {
      print('Data posted successfully: ${response.body}');
    } else {
      print('Failed to post data');
    }
  }
  Future<void> handleResponse() async {
    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=2'),

      );
      if (response.statusCode == 200) {
        print('Data loaded successfully: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
