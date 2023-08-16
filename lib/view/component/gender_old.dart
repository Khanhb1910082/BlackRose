import 'package:flutter/material.dart';

class GenderAndOld extends StatelessWidget {
  const GenderAndOld({super.key, required this.gender, required this.old});
  final String gender;
  final int old;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          color: _color()[100], borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Icon(
            _icon(),
            size: 18,
            color: _color(),
          ),
          Text(
            "$old",
            style: TextStyle(color: _color(), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  _color() => gender.toLowerCase() == "nam" ? Colors.blue : Colors.pink;

  IconData? _icon() =>
      gender.toLowerCase() == "nam" ? Icons.male : Icons.female;
}
