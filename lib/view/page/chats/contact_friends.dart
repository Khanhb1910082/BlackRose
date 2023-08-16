import 'package:blackrose/view/component/chat_card.dart';
import 'package:blackrose/view/component/search_chat.dart';
import 'package:flutter/material.dart';

class ContactFriends extends StatelessWidget {
  const ContactFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 10),
        SearchChat(),
        ChatCard(),
        ChatCard(),
        ChatCard(),
      ],
    );
  }
}
