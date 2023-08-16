import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
          fontSize: 16),
    );
  }
}
