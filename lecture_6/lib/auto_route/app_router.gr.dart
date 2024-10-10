// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:lecture_6/auto_route/dashboard.dart' as _i1;
import 'package:lecture_6/auto_route/home_page.dart' as _i2;
import 'package:lecture_6/auto_route/login_page.dart' as _i3;
import 'package:lecture_6/auto_route/product.dart' as _i4;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i1.PostsPage]
class PostsRoute extends _i5.PageRouteInfo<void> {
  const PostsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.PostsPage();
    },
  );
}

/// generated route for
/// [_i4.ProductPage]
class ProductRoute extends _i5.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i6.Key? key,
    required _i2.Product product,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return _i4.ProductPage(
        key: args.key,
        product: args.product,
      );
    },
  );
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i6.Key? key;

  final _i2.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.SettingsPage();
    },
  );
}

/// generated route for
/// [_i1.UsersPage]
class UsersRoute extends _i5.PageRouteInfo<void> {
  const UsersRoute({List<_i5.PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.UsersPage();
    },
  );
}

/// generated route for
/// [_i4.VeryNestedRoutePage]
class VeryNestedRouteRoute extends _i5.PageRouteInfo<VeryNestedRouteRouteArgs> {
  VeryNestedRouteRoute({
    _i6.Key? key,
    required int id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          VeryNestedRouteRoute.name,
          args: VeryNestedRouteRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'nestedId': id},
          initialChildren: children,
        );

  static const String name = 'VeryNestedRouteRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VeryNestedRouteRouteArgs>(
          orElse: () =>
              VeryNestedRouteRouteArgs(id: pathParams.getInt('nestedId')));
      return _i4.VeryNestedRoutePage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class VeryNestedRouteRouteArgs {
  const VeryNestedRouteRouteArgs({
    this.key,
    required this.id,
  });

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'VeryNestedRouteRouteArgs{key: $key, id: $id}';
  }
}
