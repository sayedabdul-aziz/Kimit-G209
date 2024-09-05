// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:doctor_profile_ui/widgets/contact_card_widget.dart';
import 'package:doctor_profile_ui/widgets/profile_header.dart';
import 'package:doctor_profile_ui/widgets/work_info_card.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff265ed7),
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Doctor Profile',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // header
            ProfileHeaderWidget(),
            SizedBox(height: 20),
            Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
                'Professor of Medicine, head of hospital. more than 30 years in Dermatologist'),
            SizedBox(height: 20),
            WorkInfoCard(),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Contact Info',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            ContactCardWidget(),
            SizedBox(height: 20),
            SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: Text('Chat with Doctor'))),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color(0xff265ed7),
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: Text('Book an appointment')))
          ]),
        ),
      ),
    );
  }
}
