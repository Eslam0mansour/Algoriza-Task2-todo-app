import 'package:algoriza_task2_todo_list_app/shared/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppCubit extends Cubit<AppStates>

{
  AppCubit() : super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
   DateTime today = DateTime.now();

  List<Map> alltasks = [];
   List<Map> donetasks = [];
   List<Map> undonetasks = [];
   List<Map> favtasks = [];
   List<Map> schd = [];
   late Database db ;

void CreateData () {
      openDatabase(
    'todo.dp',
    version: 1,
    onCreate: (Database db, version)
       {


        print('crated');
        db.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , start TEXT , end TEXT , status TEXT)')
            .then((value) {print('created table ');} );
      },
      onOpen: (Database db )
  {

    getdata(db);
  print('opened');
  }
  ).then((value)
    {
      db = value;
      emit(AppCreateDateState());
    }
    );
}

 insertData(
     {
       required title,
       required date ,
       required start ,
       required end }
     )
 async
{
 await db.transaction((txn)
{
  txn.rawInsert(
      'INSERT INTO tasks (title , date , start , end, status ) VALUES("$title" , "$date","$start","$end", "undone")'
  ).then((value)
  {
    print('$value inserted');
    emit(AppInsertDateState());

    getdata(db);
  });
  return Future.value();
});
}
void getdata (database)async

{
  donetasks.clear();
  undonetasks.clear();
  favtasks.clear();
    database.rawQuery('SELECT * FROM tasks').then((value) {
    alltasks = value ;
    value.forEach((element) {
     if (element['status'] == 'done') {
       donetasks.add(element);
     } else if (element['status'] == 'undone') {
       undonetasks.add(element);
     } else {
       favtasks.add(element);
     }
     schd=alltasks.where((h1) =>h1['date']==formatter.format(today)).toList();

    });


    emit(AppGetDateState());

  });
}
void update ({
  required String status,
  required int id,
})

{
   db.rawUpdate(
      'UPDATE tasks SET status = ?  WHERE id = ?',
      ['$status', id]).then((value) {
    getdata(db);

    emit(AppupdateDateState());
  });
}
void deletitem ({
  required int id
})
{
  db.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).
  then((value) {
    getdata(db);
    emit(AppdeletDateState());
  });
}
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  void updateTIMELINE(DateTime date){
    schd=alltasks.where((h1) =>h1['date']==formatter.format(date)).toList();
    today = date;
   print('to day is $today ');
    emit(updateSelctedDay());
   emit(AppGetDateState());

  }


}
