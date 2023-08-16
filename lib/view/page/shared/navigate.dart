import 'package:flutter/material.dart';
import '../../screens.dart';

class NavigateUI extends StatefulWidget {
  const NavigateUI({super.key});

  @override
  State<NavigateUI> createState() => _NavigateUIState();
}

class _NavigateUIState extends State<NavigateUI> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeView(),
    const PartyView(),
    const LoveView(),
    const ChatsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // extendBody: true,
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.black,
      //   ),
      //   title: Row(
      //     children: [
      //       ShaderMask(
      //         shaderCallback: (bounds) {
      //           return AppGradients.primaryGradient.createShader(bounds);
      //         },
      //         child: const Text("BlackRose"),
      //       ),
      //     ],
      //   ),
      //   actions: const [],
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: _selectedIndex == 0 ? Colors.transparent : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.lerp(Colors.red, Colors.black, 0.1),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
            icon: Icon(
              Icons.home,
            ),
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style_outlined),
            label: 'Phòng tiệc',
            activeIcon: Icon(
              Icons.style_rounded,
            ),
            tooltip: "Party",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.brightness_3,
              color: Colors.pink,
            ),
            label: 'Love',
            activeIcon: Icon(
              Icons.brightness_1,
              color: Colors.pink,
            ),
            tooltip: "Love",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Trò chuyện',
            activeIcon: Icon(Icons.chat_rounded),
            tooltip: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Hồ sơ',
            activeIcon: Icon(Icons.account_circle_rounded),
            tooltip: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
