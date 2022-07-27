import 'package:algoriza_task2_todo_list_app/home.dart';
import 'package:algoriza_task2_todo_list_app/pages/Schedule.dart';
import 'package:algoriza_task2_todo_list_app/pages/add_task.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  BlocOverrides.runZoned(
        () {
          runApp( MyApp());
        },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (BuildContext context) => AppCubit()..CreateData(),
      child: MaterialApp(
          initialRoute: 'Home',
          routes: {
            'Home' :(context) =>  Home(),
            'Add Task' :(context) =>  Addtask(),
            'Schedule' :(context) =>  Schedule(),

          },
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}

