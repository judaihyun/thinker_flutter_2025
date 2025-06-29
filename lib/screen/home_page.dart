import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              spacing: 10,
              children: [
                const SizedBox(height: 15),
                _getTitle(),
                _getCard(
                  title: '활성',
                  subTitle: '쿠팡 오늘의 책!',
                  height: 120,
                  width: double.infinity,
                ),
                _getCard(
                  title: '6월 13일에 종료',
                  subTitle: 'ZIGZAG 블랙 프라이데이 예고',
                  height: 120,
                  width: double.infinity,
                ),
                const SizedBox(height: 30),
                _moveCard(height: 60, width: double.infinity),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _getTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('최신 제휴사 혜택', style: TextStyle(color: Colors.white, fontSize: 25)),
      ],
    );
  }

  Container _moveCard({double? height, double width = 50}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(255, 163, 151, 150),
      ),
      // color: const Color.fromARGB(255, 163, 151, 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () => _launchUrl('https://www.youtube.com/'),
            child: const Center(
              child: Text(
                'YouTube Shopping으로 이동',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  SizedBox _getCard({
    required String title,
    required String subTitle,
    double height = 50,
    double width = 50,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(children: [_getImage(), _getContent(title, subTitle)]),
    );
  }

  Container _getImage() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text('Image', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Padding _getContent(String title, String subTitle) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: const Color.fromARGB(255, 156, 148, 148)),
          ),
          Text(subTitle, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
