import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSQr2CUfjuenybyq7yhIxW8wMRDKKH1olWlg&s'),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dr. John Doe',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Dermatologist',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Text('3.5'),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      color: const Color(0xffe2f2ff),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [Icon(Icons.call), Text('1')],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      color: const Color(0xffe2f2ff),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [Icon(Icons.call), Text('1')],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
