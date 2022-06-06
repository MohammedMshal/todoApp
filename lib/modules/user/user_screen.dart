import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UsersScreeen extends StatelessWidget {
  UsersScreeen({Key? key}) : super(key: key);

  final List<Usermodel> user = [
    Usermodel(
      id: 1,
      name: 'Mohammd mshal',
      phone: '01067246160',
    ),
    Usermodel(
      id: 2,
      name: 'Ahmed mshal',
      phone: '01061546160',
    ),
    Usermodel(
      id: 3,
      name: 'Sarah mshal',
      phone: '01067275391',
    ),
    Usermodel(
      id: 4,
      name: 'Abdo mshal',
      phone: '01079135391',
    ),
    Usermodel(
      id: 5,
      name: 'Mahmoud mshal',
      phone: '01015754391',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users screen'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => _buildItem(user[index]),
          separatorBuilder: (context, item) => const Divider(),
          itemCount: user.length),
    );
  }

  Widget _buildItem(Usermodel user) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            '${user.id}',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${user.name}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
