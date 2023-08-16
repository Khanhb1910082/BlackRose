import 'package:blackrose/utils/global.colors.dart';
import 'package:blackrose/view/component/gender_old.dart';
import 'package:blackrose/view/component/profile_avatar.dart';
import 'package:blackrose/view/component/search_chat.dart';
import 'package:blackrose/view/page/chats/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        // elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        leading: const Icon(
          Icons.contact_support_sharp,
          color: Colors.orange,
          size: 28,
        ),
        title: Center(
          child: ShaderMask(
            shaderCallback: (bounds) {
              return AppGradients.primaryGradient.createShader(bounds);
            },
            child: const Text("BlackRose"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ContactView()));
              },
              child: const Icon(
                Icons.book,
                color: Colors.green,
                size: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person_add_alt_outlined,
              color: Theme.of(context).primaryColorLight,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SearchChat(),
          const SizedBox(height: 5),
          _buildChat(),
        ],
      ),
    );
  }

  _buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
            size: 28,
          ),
          fillColor: Colors.black12,
          filled: true,
          hintText: 'Tìm kiếm lịch sử trò chuyện',
          hintStyle: TextStyle(
              color: Theme.of(context).primaryColorLight.withOpacity(0.5),
              fontSize: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
        ),
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 14),
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "Vui lòng nhập email.";
        //   }
        //   if (value.length > 100) {
        //     return 'Sai định dạng email.';
        //   }
        //   return null;
        // },
        onSaved: (newValue) {},
      ),
    );
  }

  _buildChat() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BuildProfileAvatar(
            profileHeight: 28,
            image: "profile",
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Trần Tuấn Khanh",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 3),
                      GenderAndOld(gender: "nam", old: 21)
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      "Chào bạn",
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "15:03",
              style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).primaryColorLight.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
