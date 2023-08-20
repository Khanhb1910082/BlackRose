import 'package:flutter/material.dart';

class EditUserNameView extends StatefulWidget {
  const EditUserNameView({super.key});

  @override
  State<EditUserNameView> createState() => _EditUserNameViewState();
}

class _EditUserNameViewState extends State<EditUserNameView> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _onItemTapped() {
    setState(() {
      _selectedIndex == 3 ? _selectedIndex = 0 : _selectedIndex++;
    });
  }

  final List<Widget> _pages = [
    _phonenumber(),
    _buildSet1(),
    _buildSet2(),
    _buildSet3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/giphy.gif"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IndexedStack(
                  index: _selectedIndex,
                  children: _pages,
                ),
                InkWell(
                  onTap: _onItemTapped,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_phonenumber() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          "Đăng nhập bằng số điện thoại",
          style: TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.only(bottom: 30),
      //   child: const Text(
      //     "Hãy hoàn thành hồ sơ của bạn trước khi bắt đầu.",
      //     style: TextStyle(color: Colors.white, fontSize: 14),
      //   ),
      // ),
      const Text(
        "Nhập số điện thoại",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: TextFormField(
          cursorColor: Colors.white,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            fillColor: Colors.black.withOpacity(0.6),
            filled: true,
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.green, width: 2)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      const Center(
        child: Text(
          "Mỗi số điện thoại chỉ được liên kết với 1 tài khoản.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _buildSet1() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          "Chào mừng bạn đến với BlackRose",
          style: TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: const Text(
          "Hãy hoàn thành hồ sơ của bạn trước khi bắt đầu.",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      const Text(
        "Nhập tên người dùng",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: TextFormField(
          cursorColor: Colors.white,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            fillColor: Colors.black.withOpacity(0.6),
            filled: true,
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.green, width: 2)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      const Center(
        child: Text(
          "Tên người dùng sẽ luôn hiển thị với mọi người.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}

Widget _buildSet2() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          "Phong cách",
          style: TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: const Text(
          "Chọn 1 - 5 phong cách mà bạn thích",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      const Divider(
        color: Colors.white,
        height: 2,
      ),
      const Chip(
        label: Text("Example"),
      ),
    ],
  );
}

Widget _buildSet3() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Text(
          "Sở thích",
          style: TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: const Text(
          "Chọn 1 - 5  sở thích của bạn",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      const Divider(
        color: Colors.white,
        height: 2,
      ),
      const Chip(
        label: Text("Example"),
      ),
    ],
  );
}
