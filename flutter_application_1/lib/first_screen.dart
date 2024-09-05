// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'My First App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // action
            },
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              // action
            },
            icon: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            // ClipOval(
            //   child: Image.network(
            //     'https://picsum.photos/250?image=9',
            //     // width: 200,
            //     // height: 100,
            //     // fit: BoxFit.cover,
            //   ),
            // ),
            // CircleAvatar(
            //   radius: 100,
            //   backgroundColor: Colors.blue,
            //   backgroundImage:
            //       NetworkImage('https://picsum.photos/250?image=9'),
            // ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/sayed.jpeg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sayed Abdul-Aziz',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.redAccent,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.snapchat_rounded,
                      color: Colors.yellow,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.telegram_rounded,
                      color: Colors.blueGrey,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
