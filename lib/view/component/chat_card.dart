import 'package:blackrose/view/component/gender_old.dart';
import 'package:blackrose/view/component/profile_avatar.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, top: 7),
      padding: const EdgeInsets.symmetric(vertical: 2),
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
            padding: const EdgeInsets.only(right: 15),
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
