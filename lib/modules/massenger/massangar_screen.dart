import 'package:flutter/material.dart';

class MassengarScreen extends StatelessWidget {
  const MassengarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/242752823_1247592725662368_239146347929787095_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEcTguu5gdsdyOFhkHmutZ4Ewmi1C9Q7gITCaLUL1DuAqEjm_jZ-7ADSMT7EXYiIvOWBJidfKqhQ3V7KZcaqafw&_nc_ohc=9Yz4O7AWxCUAX9LDtN3&tn=kl5ky5H-i2FKaNT5&_nc_ht=scontent.faly1-2.fna&oh=00_AT_-DV2vIHNWpeBosL4v40kG5ia7YbLUp0_k7DcO1Kex3g&oe=62950E32',
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Chats',
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(width: 15.0),
                  Text('Search')
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemBuilder: (context, index) => _buildStoryItem(),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 20.0),
                itemCount: 20,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 40.0),
            ListView.separated(
              itemBuilder: (context, index) => _buildChateItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 30,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildStoryItem() {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: const [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
            'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/242752823_1247592725662368_239146347929787095_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEcTguu5gdsdyOFhkHmutZ4Ewmi1C9Q7gITCaLUL1DuAqEjm_jZ-7ADSMT7EXYiIvOWBJidfKqhQ3V7KZcaqafw&_nc_ohc=9Yz4O7AWxCUAX9LDtN3&tn=kl5ky5H-i2FKaNT5&_nc_ht=scontent.faly1-2.fna&oh=00_AT_-DV2vIHNWpeBosL4v40kG5ia7YbLUp0_k7DcO1Kex3g&oe=62950E32',
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        )
      ],
    );
  }

  Widget _buildChateItem() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/242752823_1247592725662368_239146347929787095_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeEcTguu5gdsdyOFhkHmutZ4Ewmi1C9Q7gITCaLUL1DuAqEjm_jZ-7ADSMT7EXYiIvOWBJidfKqhQ3V7KZcaqafw&_nc_ohc=9Yz4O7AWxCUAX9LDtN3&tn=kl5ky5H-i2FKaNT5&_nc_ht=scontent.faly1-2.fna&oh=00_AT_-DV2vIHNWpeBosL4v40kG5ia7YbLUp0_k7DcO1Kex3g&oe=62950E32',
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mohammed Mshal',
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    'Hello My Name is  Mohammed Mshal',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 7.0,
                      width: 7.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Text('2:00 PM')
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
