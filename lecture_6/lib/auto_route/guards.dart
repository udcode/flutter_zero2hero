import 'package:auto_route/auto_route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app_router.gr.dart';
import 'home_page.dart';
bool authenticated = false;
class AuthGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if(authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(
          LoginRoute(
          )
      );
    }
  }
}

class FetchProductGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async{
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
   var id = resolver.route.pathParams.getString('id');
   EasyLoading.show(status: 'Fetching Product $id');
   await Future.delayed(Duration(seconds: 2));//simulate
    EasyLoading.dismiss();

   // i want to insert the fetched product into the route args
   resolver.route.queryParams.rawMap['product'] =  Product(id: int.parse(id), name: 'Product $id', price: 22);
resolver.next(true);

    }
  }



bool isAdmin = false;
class AdminGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if(isAdmin) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
     resolver.next(false);
    }
  }
}