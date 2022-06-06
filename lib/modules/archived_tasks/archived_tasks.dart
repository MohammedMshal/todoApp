import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) =>
          AppCubit.get(context).archivedTasks.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) => buildItemTasks(
                      AppCubit.get(context).archivedTasks[index], context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: AppCubit.get(context).archivedTasks.length,
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
                              'No archived yet, please add some archived',
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
