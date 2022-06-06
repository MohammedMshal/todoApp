import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udimy_abdalla_mansour/shared/components/components.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/cubit.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final database = Database;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            titleController.text = '';
            timeController.text = '';
            dateController.text = '';
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      date: dateController.text,
                      time: timeController.text,
                      title: titleController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            padding: const EdgeInsets.all(20.0),
                            color: Colors.grey[100],
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultTextFormFiled(
                                    controller: titleController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'title is empty';
                                      }
                                      return null;
                                    },
                                    keybordType: TextInputType.text,
                                    prefixIco: Icons.title,
                                    lable: 'title',
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormFiled(
                                    controller: timeController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'time is empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                    keybordType: TextInputType.datetime,
                                    prefixIco: Icons.watch_later_outlined,
                                    lable: 'Task time',
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormFiled(
                                    controller: dateController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'date is empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-07-03'),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    keybordType: TextInputType.datetime,
                                    prefixIco: Icons.watch_later_outlined,
                                    lable: 'Date time',
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archived'),
              ],
            ),
            body: state is! AppGetDatabaseLoadingState
                ? AppCubit.get(context)
                    .screens[AppCubit.get(context).currentIndex]
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  // void createDatabase() async {
  //   database = await openDatabase('todo.db', version: 2,
  //       onCreate: (database, int version) async {
  //     await database
  //         .execute(
  //             'CREATE TABLE taskes (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
  //         .then((value) {
  //       debugPrint('Database created');
  //     }).catchError((error) {
  //       debugPrint(error.toString());
  //     });
  //     debugPrint('Date created!!!!');
  //   }, onOpen: (database) {
  //     getDataFromDataBase(database).then((value) => {
  //           // setState(() {
  //           //   taskes = value;
  //           // }),
  //         });
  //     debugPrint('Date opned!!!!');
  //   });
  // }

  // Future insertDataBase({
  //   required String title,
  //   required String time,
  //   required String date,
  // }) async {
  //   await database!.transaction(
  //     (txn) async {
  //       int id1 = await txn.rawInsert(
  //           'INSERT INTO taskes(title, date, time, status) VALUES("$title", "$date","$time","new")');

  //       debugPrint('inserted1: $id1');
  //     },
  //   ).then((value) => {
  //         (database) {
  //           getDataFromDataBase(database).then((value) => {
  //                 // setState(() {
  //                 //   isButtomSheedDowen = false;
  //                 //   iconFlootingButtonChange = Icons.edit;
  //                 //   taskes = value;
  //                 // }),
  //               });
  //         }
  //       });
  // }

  // Future<List<Map>> getDataFromDataBase(database) async {
  //   return await database!.rawQuery('SELECT * FROM taskes');
  // }

  void deleteDatabase() {}
}
