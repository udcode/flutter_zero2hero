import 'package:auto_route/auto_route.dart';
import 'package:lecture_6/auto_route/product.dart';

import 'app_router.gr.dart';
import 'guards.dart';
import 'home_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
      guards: [AuthGuard()],
    ),
    AutoRoute(
      path: '/product/:id',
      page: PageInfo('productPage', builder: (data){
        var product = data.route.queryParams.rawMap['product'] as Product;
        return ProductPage(product:  product);
      }),

      guards: [AuthGuard(),FetchProductGuard()],

    ),
    AutoRoute(
      path: '/product/:id/veryNestedRoute/:nestedId',
      page: VeryNestedRouteRoute.page,

    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
  ];
}