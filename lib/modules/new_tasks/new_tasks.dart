import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udimy_abdalla_mansour/shared/components/components.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/cubit.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/states.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => AppCubit.get(context).newTasks.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) => buildItemTasks(
                  AppCubit.get(context).newTasks[index], context),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: AppCubit.get(context).newTasks.length,
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 100,
                    color: Colors.grey,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'No tasks yet, please add some tasks',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
