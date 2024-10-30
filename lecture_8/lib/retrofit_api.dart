import 'package:lecture_8/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_api.g.dart';

@RestApi(baseUrl: "/users")
abstract class UsersApi {
  factory UsersApi(Dio dio) = _UsersApi;

  @GET("")
  Future<List<UserModel>> getUsers(@Query("id") String id);

  @GET("/{id}")
  Future<UserModel> getUser(@Path("id") String id);

  @POST("")
  Future<UserModel> createUser(@Body() UserModel user);

  @PUT("/{id}")
  Future<UserModel> updateUser(@Path("id") String id, @Body() UserModel user);

  @DELETE("/{id}")
  Future<void> deleteUser(@Path("id") String id);


}


class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

@RestApi(baseUrl: "/todos")
abstract class TodosApi {
  factory TodosApi(Dio dio) = _TodosApi;

  @GET("")
  Future<List<TodoModel>> getTodos();

  @GET("/{id}")
  Future<TodoModel> getTodoById(@Path("id") String id);
}


