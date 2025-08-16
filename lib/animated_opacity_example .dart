import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
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
        color: Colors.green,

        /// blue를 안에 있는 red가 다 덮었는데 이유는 alignment 속성이 빠져서 그럼
        /// alignment 를 주지 않으면 내부에 있는 Container 는 부모 위젯의 크기로 확장됨
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: selected ? 0.3 : 1,
          curve: Curves.linear,

          /// duration 에 애니메이션이 진행되는 속도
          duration: Duration(seconds: 2),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
