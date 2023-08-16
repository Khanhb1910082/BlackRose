import 'package:blackrose/view/component/tags_setting.dart';
import 'package:blackrose/view/page/setting/edit_profile.dart';
import 'package:blackrose/view/page/setting/feedback.dart';
import 'package:blackrose/view/page/setting/switch_mode.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Cài đặt",
          style: TextStyle(
              color: Theme.of(context).primaryTextTheme.bodyLarge!.color),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SwitchMode()));
            },
            child: const TagsView(
              name: 'Chuyển đổi chế độ',
              tag: '',
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const EditProfileView()));
                },
                child: const TagsView(
                  name: 'Chỉnh sửa hồ sơ',
                  tag: '',
                ),
              ),
              _buildComponent("thay đổi hình dại diện"),
            ],
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              _buildComponent("Thông báo"),
              _buildComponent("Ngôn ngữ"),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FeedbackView()));
                },
                child: _buildComponent("Phản hồi"),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              _buildComponent("Hướng dẫn cộng đồng"),
              _buildComponent("Trung tâm an toàn"),
              _buildComponent("Điều khoản sử dụng"),
              _buildComponent("Điều khoản bán hàng"),
              _buildComponent("Về chúng tôi"),
            ],
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              _buildComponent("Danh sách chặn"),
              _buildComponent("Xóa bộ nhớ cache"),
              _buildComponent("Tài khoải"),
              _buildComponent("Cài đặt quyền riêng tư"),
              _buildComponent("Đăng xuất"),
            ],
          ),
        ],
      ),
    );
  }

  _buildComponent(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 15),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
