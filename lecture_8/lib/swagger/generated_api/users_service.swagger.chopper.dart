// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_service.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UsersService extends UsersService {
  _$UsersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UsersService;

  @override
  Future<Response<List<User>>> _usersGet() {
    final Uri $url = Uri.parse('/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<User>, User>($request);
  }

  @override
  Future<Response<User>> _usersPost({required User? user}) {
    final Uri $url = Uri.parse('/users');
    final $body = user;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _usersUserIdGet({required String? userId}) {
    final Uri $url = Uri.parse('/users/${userId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<User, User>($request);
  }
}
