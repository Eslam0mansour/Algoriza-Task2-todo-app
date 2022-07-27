import 'dart:math';

import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/states.dart';
import 'package:algoriza_task2_todo_list_app/shared/components/item_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All extends StatelessWidget {
   const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context,AppStates state) {},
        builder: (BuildContext context,AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          var tasks = AppCubit.get(context).alltasks;
          return ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index) => ItemTask(
                tasks [index],
                clr: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
              itemCount: tasks.length,
          );
        }
    );
  }
}
