import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(children: [_getHeader(), _getBody()]),
        ),
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Widget _getBody() {
    return Expanded(
      child: Container(
        color: Colors.black,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getShortBox(),
              ...List.generate(
                10,
                (index) => _getContent(
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getContent({Color? color}) {
    return Container(
      height: 300,
      color: color,
      child: Column(
        children: [
          Container(height: 250, color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black),
                ),
              ),
              Column(
                children: [
                  Text('text1', style: TextStyle(color: Colors.white)),
                  Text('text2', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Short'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 페이지'),
      ],
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      currentIndex: 0,
      onTap: (index) {
        print(index);
      },
    );
  }

  Widget _getShortBox() {
    return Container(
      height: 240,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _getShort(Colors.red),
          _getShort(Colors.blue),
          _getShort(Colors.green),
          _getShort(Colors.yellow),
          _getShort(Colors.orange),
        ],
      ),
    );
  }

  Container _getShort(Color color) {
    return Container(
      width: 160,
      height: double.infinity,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }

  Widget _getHeader() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Row(
        spacing: 5,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'logo',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ),
          Text('mice', style: TextStyle(color: Colors.white, fontSize: 15)),
          Text('...', style: TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}
