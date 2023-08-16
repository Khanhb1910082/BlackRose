import 'package:blackrose/view/component/custom_card.dart';
import 'package:flutter/material.dart';

class PartyFollowing extends StatefulWidget {
  const PartyFollowing({super.key});

  @override
  State<PartyFollowing> createState() => _PartyFollowingState();
}

class _PartyFollowingState extends State<PartyFollowing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: const [
          CustomCard(room: "Trò chuyện", amount: 10),
          CustomCard(room: "Kết bạn", amount: 10),
        ],
      ),
    );
  }
}
