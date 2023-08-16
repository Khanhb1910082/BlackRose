import 'package:flutter/material.dart';

class BannerProfile extends StatelessWidget {
  const BannerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.purple[50], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_outlined,
            color: Colors.black54,
          ),
          const SizedBox(width: 3),
          Text(
            "Anh ấy là thành viên mới",
            style: TextStyle(
                color: Colors.purpleAccent.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
