import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:lecture_8/swagger/domain/entities/user.dart';


import 'api_models_mapper.dart';
import 'generated_api/users_service.swagger.dart';
import 'logging_interceptor.dart';

void main(){
  runApp(SwaggerApp());
}

final usersApi = UsersService.create(
  baseUrl: Uri.parse('http://10.0.2.2:3001'),
  interceptors: [
    LoggingInterceptor(),
  ],

);
class SwaggerApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Swagger Example')),
        body: HomePage(),
      ),
    );
  }
}


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserEntity> users = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async{
              final response = await usersApi.usersGet();
              if(response.isSuccessful){
                setState(() {
                  users = response.body?.map((e) => ApiModelsMapper()
                      .convert<User,UserEntity >(e)).toList() ?? <UserEntity>[];
                });
              }
            },
            child: Text('get users'),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                );
              },
            ),
          ),
        ],


      ),
    );
  }
}