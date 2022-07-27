import 'package:algoriza_task2_todo_list_app/shared/bloc/cubit.dart';
import 'package:algoriza_task2_todo_list_app/shared/bloc/states.dart';
import 'package:algoriza_task2_todo_list_app/shared/components/best_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Addtask extends StatefulWidget {
   Addtask({Key? key}) : super(key: key);

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  DateTime SelctedDate = DateTime.now();

  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final _formKeya = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context,AppStates state) {},
        builder: (BuildContext context,AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
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
                    'Add Task',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formKeya,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(
                        height: 10,
                      ),
                       BestInputField(
                         validate: (String value){
                           if(value.isEmpty)
                           {
                             return 'empty';
                           }
                           return null;
                         },
                          title: 'Title',
                          hint: 'Enter Title',
                        controller: titleController,
                      ),
                      BestInputField(
                        validate: (String value){
                          if(value.isEmpty)
                          {
                            return 'empty';
                          }
                          return null;
                        },
                        controller: dateController,
                        title: 'Deadline',
                        hint: DateFormat.yMd().format(SelctedDate),
                        widget: IconButton(
                          icon:const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black,
                          ),
                          onPressed: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                            ).then((value) {
                              dateController.text = DateFormat.yMMMd().format(value!);
                              print(value.toString());
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BestInputField(
                              validate: (String value){
                                if(value.isEmpty)
                                  {
                                    return 'empty';
                                  }
                                return null;
                              },
                                title: 'Start time',
                                hint: '11:20 AM',
                                controller: startController,
                                widget: IconButton(
                                  icon:const Icon(Icons.watch_later_outlined,color: Colors.black,),
                                  onPressed: (){
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      startController.text = value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                )),
                          ),
                          Expanded(
                            child: BestInputField(
                                validate: (String value){
                                  if(value.isEmpty)
                                  {
                                    return 'empty';
                                  }
                                  return null;
                                },
                                controller: endController,
                                title: 'End time', hint: '1:20 PM',
                                widget: IconButton(
                                  icon:const Icon(Icons.watch_later_outlined,color: Colors.black,),
                                  onPressed: (){
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      endController.text = value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: MaterialButton(
                          onPressed: (){
                            if (_formKeya.currentState!.validate()) {
                            cubit.insertData(title: titleController.text, date: dateController.text, start: startController.text, end: endController.text);
                            Navigator.pop(context);
                            }
                            else
                              {
                                print('oops');
                              }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)
                          ),
                          color: Colors.green[400],
                          height: 55,
                          minWidth: double.infinity,
                          child: const Text(
                            'Create Task',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
