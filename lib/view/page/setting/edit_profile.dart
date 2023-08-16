import 'package:blackrose/view/component/tags_setting.dart';
import 'package:blackrose/view/page/shared/title_setting.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: "Chỉnh sửa hồ sơ"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.save),
          ),
        ],
      ),
      body: ListView(
        children: [
          const TagsView(name: "Tên", tag: "Bé Lài"),
          const TagsView(name: "Ngày sinh", tag: "2004-1-19"),
          _buildStory(),
          const SizedBox(height: 10),
          _buildStyleOfLife("Phong cách sống"),
          const SizedBox(height: 10),

          _buildStyleOfLife("Hoạt động yêu thích"),
          // _buildFavoriteActivity(),
        ],
      ),
    );
  }

  _buildStory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Tiểu sử",
              style: TextStyle(fontSize: 15),
            ),
          ),
          _buildInputStory(),
        ],
      ),
    );
  }

  _buildInputStory() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        maxLines: 3,
        initialValue: 'Anh ấy là thành viên mới',
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        cursorColor: Colors.black,
        maxLength: 200,
      ),
    );
  }

  _buildStyleOfLife(String activity) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              activity,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Wrap(
            spacing: 10,
            children: [
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
              _buildInputChip("Độc thân"),
            ],
          )
        ],
      ),
    );
  }

  _buildInputChip(String name) {
    return InputChip(
      // padding: EdgeInsets.only(right: 0),
      // labelPadding: EdgeInsets.only(left: 2),
      label: Text(name),
      onDeleted: () {},
    );
  }
}
