import 'package:blackrose/view/page/chats/contact_friends.dart';
import 'package:blackrose/view/page/shared/title_setting.dart';
import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TextTitle(title: 'Liên lạc'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.person_add_alt_outlined,
                color: Theme.of(context).primaryColorLight,
                size: 28,
              ),
            ),
          ],
          bottom: const TabBar(
            isScrollable: false,
            indicatorColor: Colors.redAccent,
            tabs: [
              Tab(
                text: 'Bạn bè',
              ),
              Tab(
                text: 'Fan',
              ),
              Tab(
                text: 'Người theo dõi',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ContactFriends(),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
