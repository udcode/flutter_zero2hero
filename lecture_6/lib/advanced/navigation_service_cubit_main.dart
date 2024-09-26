import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'navigation_service.dart';

void main() {
  navigationService.listenToAuthBloc(authBloc);
  runApp(MyApp());
}
final authBloc = AuthBloc();
final navigationService = NavigationService();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    // Let the navigation service listen to AuthBloc state changes
    print('asdlkjsdlkj');


    return BlocProvider(
      create: (_) => authBloc,
      child: MaterialApp(
        navigatorKey: navigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),


          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(appBar: AppBar(title: Text("Profile")),body: Center(child: Column(

      children: [
        Text("Profile"),
        ElevatedButton(onPressed: () {
          bloc.add(LogoutEvent());
        }, child: Text("Logout"))
      ],
    )),);
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) => current is AuthLoading || current is AuthLoaded,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(

                        controller: _usernameController,
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final username = _usernameController.text;
                          final password = _passwordController.text;
                          authBloc.add(LoginEvent(username, password));
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ), if (state is AuthLoading)
                    Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                authBloc.add(LogoutEvent());
              },
              child: Text("Logout"),
            ),
            //go to profile
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
