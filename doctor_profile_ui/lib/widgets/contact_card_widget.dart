import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
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
            text: 'Ca@gmail.com',
            icon: Icons.email,
          ),
          SizedBox(
            height: 10,
          ),
          RowItemWidget(
            text: '01010101010',
            icon: Icons.call,
          ),
          SizedBox(
            height: 10,
          ),
          RowItemWidget(
            text: '02020201290',
            icon: Icons.call,
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
