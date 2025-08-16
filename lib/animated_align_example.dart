import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
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
        color: Colors.blue,
        child: AnimatedAlign(
          /// alignment 속성이 변경이 되면 애니메이션이 진행됨
          alignment: selected ? Alignment.topLeft : Alignment.bottomRight,
          curve: Curves.easeIn,
          /// duration 에 애니메이션이 진행되는 속도
          duration: Duration(seconds: 2),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
