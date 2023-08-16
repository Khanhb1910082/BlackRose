import 'package:blackrose/utils/global.colors.dart';
import 'package:blackrose/view/page/party/party_following.dart';
import 'package:flutter/material.dart';

class PartyView extends StatefulWidget {
  const PartyView({super.key});

  @override
  State<PartyView> createState() => _PartyViewState();
}

class _PartyViewState extends State<PartyView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: ShaderMask(
            shaderCallback: (bounds) {
              return AppGradients.primaryGradient.createShader(bounds);
            },
            child: const Text("BlackRose"),
          ),
          actions: [
            // Icon(
            //   Icons.star_border_purple500_rounded,
            //   color: Colors.pink,
            //   size: 36,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search_rounded,
                color: Theme.of(context).primaryColorLight.withOpacity(0.8),
                size: 32,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            labelColor: Colors.red,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            indicatorColor: Colors.redAccent,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            tabs: const [
              Tab(
                text: "Đang theo dõi",
              ),
              Tab(
                text: "Riêng bạn",
              ),
              Tab(
                text: "Hot",
              ),
              Tab(
                text: "Mới",
              ),
              Tab(
                text: "Giải trí",
              ),
              Tab(
                text: "Kết bạn",
              ),
              Tab(
                text: "Trò chơi",
              ),
              Tab(
                text: "Nói chuyện",
              ),
              Tab(
                text: "Gần đây",
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: const TabBarView(
          children: [
            PartyFollowing(),
            Center(child: Text("Riêng bạn")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
            Center(child: Text("Đang theo dõi")),
          ],
        ),
      ),
    );
  }
}
