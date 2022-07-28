import 'dart:math';

import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/states.dart';
import 'package:algoriza_task2_todo_list_app/shared/components/item_task.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Schedule extends StatelessWidget {

  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context,AppStates state) {},
         builder: (BuildContext context,AppStates state) {
           var tasks = AppCubit.get(context).schd;
          List<Color> myColorss = [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.purple,
           ];
           return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded , size: 30, color: Colors.black,),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Schedule',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    AppCubit.get(context).updateTIMELINE(date);
                  },
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   DateFormat.EEEE().format(AppCubit.get(context).today),
                      //   style: const TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18)
                      //   ,),
                      // Text(
                      //   DateFormat.yMMMd().format(AppCubit.get(context).today),
                      //   style: const TextStyle(
                      //       fontSize: 16
                      //   ),
                      // ),
                    ],
                  ),

                ),
                const SizedBox(
                  height: 20,
                ),
             ListView.separated(
               shrinkWrap: true,
               itemBuilder: (context, index) => ItemTask(
                    tasks[index],
                 clr: myColorss[Random().nextInt(myColorss.length)],),
               separatorBuilder: (context, index) => Container(
                 width: double.infinity,
                 height: 1,
                 color: Colors.grey[200],
               ),
               itemCount: tasks.length,
             ),

              ],
            ),
          );
         },
    );
  }
}
