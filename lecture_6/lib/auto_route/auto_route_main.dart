import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_router.dart';

void main() {
  runApp(App());
}



class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      builder: EasyLoading.init(),
      routerConfig: _appRouter.config(


      ),
    );
  }
}