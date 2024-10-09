// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:lecture_6/auto_route/home_page.dart' as _i1;
import 'package:lecture_6/auto_route/login_page.dart' as _i2;
import 'package:lecture_6/auto_route/product.dart' as _i3;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.ProductPage]
class ProductRoute extends _i4.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i5.Key? key,
    required _i1.Product product,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteArgs>();
      return _i3.ProductPage(
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

  final _i5.Key? key;

  final _i1.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i3.VeryNestedRoutePage]
class VeryNestedRouteRoute extends _i4.PageRouteInfo<VeryNestedRouteRouteArgs> {
  VeryNestedRouteRoute({
    _i5.Key? key,
    required int id,
    List<_i4.PageRouteInfo>? children,
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

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VeryNestedRouteRouteArgs>(
          orElse: () =>
              VeryNestedRouteRouteArgs(id: pathParams.getInt('nestedId')));
      return _i3.VeryNestedRoutePage(
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

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'VeryNestedRouteRouteArgs{key: $key, id: $id}';
  }
}
