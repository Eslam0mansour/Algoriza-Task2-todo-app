import 'package:algoriza_task2_todo_list_app/pages/Favourite_page.dart';
import 'package:algoriza_task2_todo_list_app/pages/all_page.dart';
import 'package:algoriza_task2_todo_list_app/pages/completed_page.dart';
import 'package:algoriza_task2_todo_list_app/pages/uncompleted_page.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context,AppStates state) {},
        builder: (BuildContext context,AppStates state) {
          AppCubit cubit = AppCubit.get(context);
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Board',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
              actions: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'Schedule');
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Schedule',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
              bottom: const TabBar(
                isScrollable:true,
                indicatorColor: Colors.black,
                labelColor: Colors.grey,
                tabs: [
                  Tab(text: 'All',),
                  Tab(text: 'Completed',),
                  Tab(text: 'Uncompleted',),
                  Tab(text: 'Favourite',),
                ],
              ),
            ),
            body:  TabBarView(
              children: [
                All(),
                Completed(),
                UnCompleted(),
                Favourite(),
              ],
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'Add Task');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)
                ),
                color: Colors.green[400],
                height: 55,
                minWidth: double.infinity,
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              ),
            ),

          ),
        );
      }
    );
  }
}
