//create a dio api
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lecture_8/user_model.dart';
class MyIntercptor implements Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }

}
class Api {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  ));

  Api(){
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          print('requrest url: ${options.uri}');
          options.extra['requestTime'] = DateTime.now().millisecondsSinceEpoch;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          var responseTime = DateTime.now().millisecondsSinceEpoch;
          var requestTime = response.requestOptions.extra['requestTime'];

          print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => TIME: ${responseTime - requestTime}ms');
          print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
      ),],);}





  Future<Response> get(CancelToken cancelationToken) async {
    return await dio.get('/todos/1',queryParameters: {'_limit': 5},cancelToken: cancelationToken);
  }

  Future<Response> post(String username, String password) async {
  var user =  UserModel(name: username, email: password);
    return await dio.post('/posts',data: user.toJson());
  }

  Future<Response> put(String id, String username, String password) async {
    return await dio.put('/posts/$id',data: {'username': username, 'password': password});
  }

  Future<Response> delete(String id) async {
    return await dio.delete('/posts/$id');
  }
}