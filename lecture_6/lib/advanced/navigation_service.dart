import 'package:flutter/material.dart';


import 'cubit/cubit.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void listenToAuthBloc(AuthBloc authBloc) {
    authBloc.stream.listen((state) {
      if (state is AuthSuccess) {
        navigatorKey.currentState?.pushReplacementNamed('/home');
      } else if ( state is AuthInitial) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) =>    false);

      }
    });
  }

  Future<T?>? push<T>(Route<T> route) {
    return navigatorKey.currentState?.push(route);
  }

  Future<T?>? pushNamed<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void pop<T extends Object>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }
}
