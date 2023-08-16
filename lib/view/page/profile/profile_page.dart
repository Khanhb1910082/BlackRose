import 'package:blackrose/icons/app_icons.dart';
import 'package:blackrose/utils/global.colors.dart';
import 'package:blackrose/view/component/gender_old.dart';
import 'package:blackrose/view/component/profile_avatar.dart';
import 'package:blackrose/view/component/profile_banner.dart';
import 'package:blackrose/view/component/profile_detail.dart';
import 'package:blackrose/view/page/profile/post_page.dart';
import 'package:blackrose/view/page/setting/setting_page.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final double coverHeight = 180;
  final double profileHeight = 100;
  late Color _appbarColor = Colors.transparent;
  late Color backgroundIcon = Colors.black45;
  late double sizeIcon = 21;
  final _scrollController = ScrollController();
  late double opacity = 0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        opacity = _scrollController.offset > 50
            ? 1
            : _scrollController.offset / coverHeight;

        _appbarColor = Theme.of(context).primaryColor;

        if (_scrollController.offset > 50) {
          backgroundIcon = Colors.white;
          sizeIcon = 23;
        } else {
          backgroundIcon = Colors.black45;
          sizeIcon = 21;
        }
        // print(opacity);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(40),
      //   child: AppBarView.appBarView,
      // ),
      appBar: AppBar(
        backgroundColor: _appbarColor.withOpacity(opacity),
        elevation: 1,
        title: ShaderMask(
          shaderCallback: (bounds) {
            return AppGradients.primaryGradient.createShader(bounds);
          },
          child: const Text(
            "BlackRose",
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding:
                const EdgeInsets.only(top: 10, right: 8, bottom: 10, left: 4),
            decoration: BoxDecoration(
              color: backgroundIcon,
              shape: BoxShape.circle,
            ),
            child: Icon(
              MyFlutterApp.crown,
              color: Colors.yellow[700],
              size: sizeIcon - 4,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: backgroundIcon,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified_user,
              color: Colors.blue,
              size: sizeIcon,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: backgroundIcon,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SettingView()));
              },
              child: Icon(
                Icons.settings,
                color: Colors.redAccent,
                size: sizeIcon,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const PostView()));
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 30,
            )),
      ),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        children: [
          Container(
            // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              children: [
                _buildAvata(),
                const SizedBox(height: 5),
                _profileDetail(),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          // _buildPost(),
          const SizedBox(height: 10),
          _buildWall(),
        ],
      ),
    );
  }

  _buildCoverImage() => Container(
        color: Colors.green,
        child: Image.asset(
          "assets/images/background.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  _buildProfileImage(profileHeight) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(coverHeight)),
        child: CircleAvatar(
          radius: profileHeight,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const AssetImage('assets/images/ny.jpg'),
        ),
      );

  _buildAvata() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: _buildCoverImage(),
        ),
        Positioned(
          top: top,
          // child: _buildProfileImage(profileHeight / 2),
          child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(profileHeight)),
              child: BuildProfileAvatar(
                profileHeight: profileHeight / 2,
                image: "ny",
              )),
        ),
      ],
    );
  }

  _profileDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bé Lài",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 3),
                GenderAndOld(
                  gender: "nữ",
                  old: 19,
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text("Cách xa 10km"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("Following", 123),
                _buildDivider(),
                _buildButton("Fan", 500),
                _buildDivider(),
                _buildButton("Ghé thăm", 8720),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BannerProfile(),
                SizedBox(width: 3),
                Icon(
                  Icons.edit,
                  size: 15,
                ),
              ],
            ),
          ),
          const ProfileDetail(),
          const SizedBox(height: 10),
          _buildDividerHor(),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Phong cách sống",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                _buildSpecial("Dễ gần"),
                _buildSpecial("Dễ thương"),
                _buildSpecial("Đọc sách"),
                _buildSpecial("Nấu ăn"),
                _buildSpecial("Xem phim"),
                _buildSpecial("Chơi game"),
                _buildSpecial("Cô đơn"),
                _buildSpecial("Nhạt nhẽo"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildDividerHor(),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Sở thích",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                _buildSpecial("Dễ gần"),
                _buildSpecial("Dễ thương"),
                _buildSpecial("Đọc sách"),
                _buildSpecial("Nấu ăn"),
                _buildSpecial("Xem phim"),
                _buildSpecial("Chơi game"),
                _buildSpecial("Cô đơn"),
                _buildSpecial("Nhạt nhẽo"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildButton(String text, int count) {
    return MaterialButton(
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$count',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  _buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(color: Colors.black26),
      );
  _buildSpecial(String person) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Chip(
          // avatar: _buildIcon(person),
          labelPadding: const EdgeInsets.only(left: 0),
          label: Text(person),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: Theme.of(context)
                      .primaryTextTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  width: 1)),
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .primaryTextTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.9),
              fontSize: 10,
              fontWeight: FontWeight.w400),
        ),
      );

  _buildIcon(String person) {
    switch (person) {
      case "Dễ gần":
        {
          return const Icon(
            Icons.person_add_alt_rounded,
            color: Colors.green,
            size: 20,
          );
        }

      case "Chơi game":
        {
          return const Icon(
            Icons.games_outlined,
            color: Colors.red,
            size: 20,
          );
        }

      default:
        {
          return const Icon(
            Icons.ac_unit_rounded,
            color: Colors.blue,
            size: 20,
          );
        }
    }
  }

  _buildDividerHor() => const Divider(
        color: Colors.black12,
      );
  _buildPost() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.only(top: 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bài viết",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Bộ lọc",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildProfileImage(profileHeight / 5),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Bạn đang nghĩ gì?"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                _buildDividerHor(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 20,
                          color: Colors.red,
                        ),
                        SizedBox(width: 2),
                        Text("Live"),
                      ],
                    ),
                    _buildDivider(),
                    const Row(
                      children: [
                        Icon(
                          Icons.photo_camera_back,
                          size: 22,
                          color: Colors.green,
                        ),
                        SizedBox(width: 2),
                        Text("Ảnh"),
                      ],
                    ),
                    _buildDivider(),
                    const Row(
                      children: [
                        Icon(
                          Icons.video_camera_back,
                          size: 20,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 2),
                        Text("video"),
                      ],
                    ),
                  ],
                ),
                _buildDividerHor(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildWall() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bài đăng",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "Quản lý bài viết",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text("Không có bài viết")
      ],
    );
  }
}
