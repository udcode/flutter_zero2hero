//simple login page
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lecture_6/auto_route/guards.dart';

import 'app_router.gr.dart';
@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the home page
            authenticated = true;
            AutoRouter.of(context).push(HomeRoute());
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
