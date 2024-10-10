import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';
@RoutePage()
class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                NavLink(label: 'Users', destination: const UsersRoute()),
                NavLink(label: 'Posts', destination: const PostsRoute()),
                NavLink(label: 'Settings', destination: const SettingsRoute()),
              ],
            ),
            Expanded(
              // nested routes will be rendered here
              child: AutoRouter(), // this is important
            ),
          ],
        ),
      ),
    );
  }
}

class NavLink extends StatelessWidget {
 final  PageRouteInfo destination;
  final String label;
  const NavLink({super.key,required this.destination,required this.label});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     onPressed: () {
       AutoRouter.of(context).push(destination,
       );
     },
     child: Text(label),
   );
  }
}



@RoutePage()
class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Users Page'),
    );
  }
}
@RoutePage()
class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Posts Page'),
    );
  }
}
@RoutePage()
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}