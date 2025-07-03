import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    _images = await _picker.pickMultiImage();

    if (!_images.isEmpty) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (_images.isNotEmpty) {
          _currentPage++;
          if (_currentPage >= _images.length) {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        }
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('전자액자')),
      body: _images.isEmpty
          ? const Center(child: Text('no data'))
          : PageView(
              controller: _pageController,
              children: _images
                  .map(
                    (e) => FutureBuilder<Uint8List>(
                      future: e.readAsBytes(),
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final data = asyncSnapshot.data;
                        if (data == null) {
                          return const Center(child: Text('이미지를 불러올 수 없습니다.'));
                        }

                        return Image.memory(data, width: double.infinity);
                      },
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
