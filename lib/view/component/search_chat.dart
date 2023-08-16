import 'package:flutter/material.dart';

class SearchChat extends StatefulWidget {
  const SearchChat({super.key});

  @override
  State<SearchChat> createState() => _SearchChatState();
}

class _SearchChatState extends State<SearchChat> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColorLight.withOpacity(0.8),
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
        cursorColor: Theme.of(context).primaryColorLight.withOpacity(0.8),
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
}
