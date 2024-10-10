import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersScreen(),
    );
  }
}

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://reqres.in/api/users?page=2'))
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        setState(() {
          users = json.decode(response.body)['data'];
        });
      } else {
        showError('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      showError('An error occurred: $e');
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
        ),
        body: users.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]['first_name'] + ' ' + users[index]['last_name']),
              subtitle: Text(users[index]['email']),
            );
          },
        ),
        floatingActionButton: Column(
          children: [
            FloatingActionButton(
              onPressed: () async {
                await postData();
                 fetchUsers();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () async {
                await fetchDataWithRetry();
              },
              child: Icon(Icons.refresh),
            ),
      
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () async {
                await fetchMultipleRequests();
              },
              child: Text('Fetch Multiple'),
            ),
            SizedBox(height: 16),
            //login
            FloatingActionButton(
              onPressed: () async {
               //show login dialog
                await showDialog(
                  context: context,
                  builder: (context) {
                    String email = '';
                    String password = '';
                    return AlertDialog(
                      title: Text('Login'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            onChanged: (value) => email = value,
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                          TextField(
                            onChanged: (value) => password = value,
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          child: Text('Login'),
                          onPressed: () {
                    loginUser(email, password);
                    Navigator.pop(context);
                    })],
                    );
                  },
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
       showError('Login successful!');
      } else {
        showError('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred during login: $e');
    }
  }
  Future<void> fetchMultipleRequests() async {
    try {
      final responses = await Future.wait([
        http.get(Uri.parse('https://reqres.in/api/users?page=1')),
        http.get(Uri.parse('https://reqres.in/api/users?page=2')).then((response) {
         return http.get(Uri.parse('https://reqres.in/api/users?page=5'));
        }),
        http.get(Uri.parse('https://reqres.in/api/users?page=3')),
      ]);

      for (var response in responses) {
        if (response.statusCode == 200) {
          print('Data: ${json.decode(response.body)}');
          users.addAll(json.decode(response.body)['data']);
          setState(() {});
        } else {
          print('Failed to load data: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('An error occurred while fetching multiple requests: $e');
    }
  }

  Future<void> fetchDataWithRetry({int retries = 3}) async {
    int attempt = 0;
    while (attempt < retries) {
      try {
        final response = await http
            .get(
          Uri.parse('https://reqres.in/api/users?page=2'),
          headers: {'Authorization': 'Bearer YOUR_TOKEN_HERE'},
        )
            .timeout(Duration(seconds: 5));
        if (response.statusCode == 200) {
          print('Data: ${response.body}');
          users = json.decode(response.body)['data'];
          setState(() {});
          return;
        } else {
          print('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        print('Attempt ${attempt + 1} failed: $e');
        showError('Attempt ${attempt + 1} failed: $e');
        if (attempt == retries - 1) {
          print('All retry attempts failed.');
        }
      }
      attempt++;
      await Future.delayed(Duration(seconds: 2)); // להמתין לפני ניסיון נוסף
    }
  }

  Future<void> postData() async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
        body: json.encode({"name": "morpheus", "job": "leader"}),
      );
      if (response.statusCode == 201) {
        showError('User added successfully!');
      } else {
        showError('Failed to add user: ${response.statusCode}');
      }
    } catch (e) {
      showError('An error occurred: $e');
    }
  }
}