import 'package:flutter/material.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/cubit.dart';

Widget defaultButton({
  bool isUpperCase = true,
  double width = double.infinity,
  Color backgroundColor = Colors.blue,
  required String text,
  required Function() onPressed,
}) =>
    Container(
      width: width,
      color: backgroundColor,
      child: MaterialButton(
        onPressed: onPressed,
        height: 60.0,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextFormFiled({
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
  required TextInputType keybordType,
  required IconData prefixIco,
  required String? lable,
  Function()? onChanged,
  Function()? onSubmitte,
  Function()? onPressedSuffix,
  Function()? onTap,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      keyboardType: keybordType,
      onChanged: (value) {
        onChanged;
      },
      onFieldSubmitted: (value) {
        onSubmitte;
      },
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIco),
        suffixIcon: suffix != null
            ? InkWell(
                onTap: onPressedSuffix, child: const Icon(Icons.visibility))
            : null,
        labelText: lable,
        border: const OutlineInputBorder(),
      ),
    );

Widget buildItemTasks(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archive', id: model['id']);
                },
                icon: const Icon(
                  Icons.archive_outlined,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
