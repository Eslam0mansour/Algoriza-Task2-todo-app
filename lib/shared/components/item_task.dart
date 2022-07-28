import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemTask extends StatelessWidget {
  final Color? clr;
  bool comp = true;

  Map task;

   ItemTask(this.task,  {Key? key, this.clr,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: clr,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children:  [
                  Text(
                    '${task['start']}',
                    style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '${task['title']}',
                    style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${task['date']}',
                    style:TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            AppCubit.get(context).update(status: 'done', id:  task['id'] );
                          },
                          icon: SvgPicture.asset(
                              "assets/a.svg",
                            color: Colors.white,
                          ),
                      ),
                      IconButton(
                        onPressed: (){
                          AppCubit.get(context).update(status: 'fav', id:  task['id'] );

                        },
                        icon: Icon(
                          Icons.favorite_border
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          AppCubit.get(context).deletitem(id: task['id']);
                        },
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
      );
    }
}
