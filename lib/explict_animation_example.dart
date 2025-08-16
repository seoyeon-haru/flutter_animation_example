import 'package:flutter/material.dart';

class ExplictAnimationExample extends StatefulWidget {
  @override
  State<ExplictAnimationExample> createState() =>
      _ExplictAnimationExampleState();
}

/// TickerProviderStateMixin 을 사용하게 되면 클래스 자체가 vsync 속성에 들어갈 수 있는 상태가 됨
class _ExplictAnimationExampleState extends State<ExplictAnimationExample>
    with TickerProviderStateMixin {
  /// this 에러 나는 이유 => _ExplictAnimationExampleState 클래스가 초기화 되기 전에
  /// 다시 이 클래스에 접근을 하고 있어서 에러남 => late
  /// late 를 써주게 되면 AnimationController 변수는 ExplictAnimationExampleState 객체가
  /// 초기화가 완료된 뒤에 값이 할당이 되게 됨
  late final animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
  );

  /// animationController 를 넣어주게 되면 animation 타입을 리턴해줌
  /// 클래스가 초기화 되지 않았는데 animationController 값에 접근을 하고 있어서 에러 발생 => late
  late final animation =
      Tween<double>(begin: 0, end: 300).animate(animationController);

  @override
  void dispose() {
    // 메모리에서 안전하게 소거
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: (details) {
        // 꾹 클릭했을 때 호출
        animationController.forward();
      },
      onLongPressEnd: (details) {
        // 누른 상태에서 손가락을 때주면 호출
        animationController.stop();
      },
      onLongPressCancel: () {
        // 꾹 누른 상태로 손가락 바깥으로 이동해서 취소되면 호출
        animationController.stop();
      },
      onDoubleTap: () {
        // 두 번 터치했을 때 함수 실행
        animationController.reset();
      },
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: 50,
              height: 300,
              color: Colors.red,
            ),
            AnimatedBuilder(

                /// 속성에 animation 이 들어가고
                /// animation 값이 변경될 때마다 빌더 속성에 넣어준 함수가 계속 호출이 돼서
                /// 위젯이 다시 그려짐
                /// 빌더 속성에 들어가는 함수는 Context ,  위젯 타입 Child 가 들어가게 됨
                animation: animation,
                builder: (context, child) {
                  print('animationController : ${animationController.value}');
                  print('animation : ${animation.value}');
                  return Container(
                    width: 50,
                    height: animation.value,
                    color: Colors.green,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
