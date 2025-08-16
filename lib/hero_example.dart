import 'package:flutter/material.dart';

/// 각각의 서로 다른 페이지에 있는 이미지 위젯들이
/// 하나의 Hero 로 묶이게 됨
/// 묶이는 기준이 tag 기준으로 묶임

class HeroExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HeroPage();
            },
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            Hero(
              tag: 'sample-image',
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://picsum.photos/200/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('상품명'),
            SizedBox(width: 10),
            Text('200,000원'),
          ],
        ),
      ),
    );
  }
}

/// HeroExample 위젯에서 Container 터치했을 때 HeroPage 로 넘어옴
/// 넘어오면서 이미지가 커지게 하는 효과
class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: 'sample-image',
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://picsum.photos/200/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
