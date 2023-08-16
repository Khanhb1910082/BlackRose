import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Row(
            children: [
              Icon(
                Icons.home,
                color: Colors.black45,
              ),
              SizedBox(width: 10),
              Text("Sống tại Thành phố Cần Thơ"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Row(
            children: [
              Icon(
                Icons.location_city_rounded,
                color: Colors.black45,
              ),
              SizedBox(width: 10),
              Text("Trường Đại học Cần Thơ"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Row(
            children: [
              Icon(
                Icons.wc_rounded,
                color: Colors.black45,
              ),
              SizedBox(width: 10),
              Text("Hẹn hò"),
            ],
          ),
        ),
      ],
    );
  }
}
