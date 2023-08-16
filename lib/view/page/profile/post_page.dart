import 'package:blackrose/view/component/tags_chip.dart';
import 'package:blackrose/view/page/shared/title_setting.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: const TextTitle(
                  title: 'Gửi',
                ),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              _buildInputText(),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  _buidHashtag(),
                  _buildBottomBar(),
                ],
              )),
        ],
      ),
    );
  }

  _buildInputText() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Bạn đang nghĩ gì ?',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
        cursorColor: Colors.red,
        maxLines: 6,
        maxLength: 300,
        keyboardType: TextInputType.text,
      ),
    );
  }

  _buidHashtag() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagsChip(namechip: 'Thêm vị trí'),
          SizedBox(width: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
                TagsChip(namechip: 'hashtag'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.insert_emoticon),
              SizedBox(width: 10),
              Icon(Icons.image_outlined),
            ],
          ),
          Row(
            children: [
              const Text(
                'Công khai',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
