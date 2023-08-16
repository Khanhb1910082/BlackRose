import 'package:blackrose/view/component/tags_setting.dart';
import 'package:blackrose/view/page/shared/title_setting.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(title: 'Phản hồi'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          TagsView(name: 'Báo cáo sự cố / lỗi', tag: ''),
          TagsView(name: 'Vấn đề nạp tiền', tag: ''),
          TagsView(
              name: 'Báo cáo các mối quan tâm liên quan đến an toàn', tag: ''),
          TagsView(name: 'Đề xuất', tag: ''),
          TagsView(name: 'Phản hồi về trãi nghiệm của bạn', tag: ''),
          SizedBox(height: 10),
          TagsView(name: 'Lịch sử phản hồi', tag: ''),
        ],
      ),
    );
  }
}
