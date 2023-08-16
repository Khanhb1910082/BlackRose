import 'package:flutter/material.dart';

class BuildProfileAvatar extends StatelessWidget {
  const BuildProfileAvatar(
      {super.key, required this.profileHeight, required this.image});
  final double profileHeight;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 0.4,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(profileHeight),
      ),
      child: CircleAvatar(
        radius: profileHeight,
        backgroundImage: AssetImage('assets/images/$image.jpg'),
      ),
    );
  }
}
