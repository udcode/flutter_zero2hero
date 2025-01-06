import 'dart:async';

import 'package:chopper/chopper.dart';

class LoggingInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async{
    final request = chain.request;
    print('Sending request: ${request.url}');
    final response = await chain.proceed(request);
    print('Received response: ${response.statusCode} body: ${response.body}');
    return response;

  }


}