import 'package:flutter/material.dart';

class TagsView extends StatelessWidget {
  const TagsView({super.key, required this.name, required this.tag});
  final String name;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                tag,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
