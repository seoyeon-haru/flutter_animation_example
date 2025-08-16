import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  /// alignment 속성에 들어가는 alignment 값을 변경하기 위해서 selected 선언
  /// selected 변수를 바꿔가면서 alignment 값을 바꿔줌
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    /// selected 값 변경해주기 위해서 Container GestureDetector 로 감싸줌
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.red,

        /// blue를 안에 있는 red가 다 덮었는데 이유는 alignment 속성이 빠져서 그럼
        /// alignment 를 주지 않으면 내부에 있는 Container 는 부모 위젯의 크기로 확장됨
        alignment: Alignment.center,
        child: Stack(
          children: [
            AnimatedPositioned(
              left: selected ? 100 : 0,
              top: selected ? 100 : 0,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              ),
              duration: Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
  }
}
