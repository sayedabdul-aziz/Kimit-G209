import 'package:chat_app_ui/chat/chat_model.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
                'https://www.transparenttextures.com/patterns/cubes.png'),
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(users[index].avatarUrl),
                      ),
                      if (users[index].isOnline)
                        const Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.green,
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(users[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.bold)),
                        Text(
                          users[index].message,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(users[index].time),
                ]),
              );
            }),
      ),
    );
  }
}
