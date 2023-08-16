import 'package:flutter/material.dart';

class TagsChip extends StatelessWidget {
  const TagsChip({super.key, required this.namechip});
  final String namechip;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Chip(
        // avatar: _buildIcon(person),
        labelPadding: const EdgeInsets.only(left: 0),
        label: Text(namechip),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
                color: Theme.of(context)
                    .primaryTextTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.5),
                width: 1)),
        labelStyle: TextStyle(
            color: Theme.of(context)
                .primaryTextTheme
                .bodyLarge!
                .color!
                .withOpacity(0.9),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
