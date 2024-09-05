import 'package:flutter/material.dart';

class WorkInfoCard extends StatelessWidget {
  const WorkInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xffe2f2ff),
          borderRadius: BorderRadius.circular(10)),
      child: const Column(
        children: [
          RowItemWidget(
            text: 'Cairo Hospital',
            icon: Icons.local_hospital_rounded,
          ),
          SizedBox(
            height: 10,
          ),
          RowItemWidget(
            text: '10:00 PM : 11:31 PM',
            icon: Icons.watch_later_outlined,
          ),
          SizedBox(
            height: 10,
          ),
          RowItemWidget(
            text: '2 Makram, Nasr city',
            icon: Icons.location_on_sharp,
          )
        ],
      ),
    );
  }
}

class RowItemWidget extends StatelessWidget {
  const RowItemWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color(0xff265ed7),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(text)
      ],
    );
  }
}
