import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => AppCubit.get(context).doneTasks.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) => buildItemTasks(
                  AppCubit.get(context).doneTasks[index], context),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: AppCubit.get(context).doneTasks.length,
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
                          'No done yet, please add some done',
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
