import 'package:flutter/material.dart';

class EditUserNameView extends StatelessWidget {
  const EditUserNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/giphy.gif"), fit: BoxFit.cover),
        ),
        child: Center(
          child: _buildSet2(),
        ),
      ),
    );
  }

  _buildSet1() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
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
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.6),
                filled: true,
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
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
          Center(
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
    );
  }

  _buildSet2() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
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
          Divider(
            color: Colors.white,
            height: 2,
          ),
          Chip(label: Text("Example"))
        ],
      ),
    );
  }
}
