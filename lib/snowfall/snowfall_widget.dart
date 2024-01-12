import 'package:flutter/material.dart';
import 'package:snowfall/snowfall/snowflakes.dart';

class SnowfallWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final int numberOfSnowflakes;
  final int alpha;

  const SnowfallWidget(
      {Key? key,
      required this.child,
      this.numberOfSnowflakes = 50,
      this.color = Colors.white, // 기본 색상 값으로 Colors.white 설정
      this.alpha = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/img/splash.png',
              fit: BoxFit.cover,
              width: 300,
            ), // 배경 이미지 추가
          ),
          Positioned.fill(
            child: Snowflakes(
              numberOfSnowflakes: numberOfSnowflakes,
              color: color, // 여기서 위젯의 color 속성 사용
              alpha: alpha,
            ),
          ),
          Positioned.fill(child: child),
        ],
      );
}

class SnowfallWidget2 extends StatelessWidget {
  final Widget child;
  final Color color;
  final int numberOfSnowflakes;
  final int alpha;

  const SnowfallWidget2(
      {Key? key,
      required this.child,
      this.numberOfSnowflakes = 50,
      this.color = Colors.white, // 기본 색상 값으로 Colors.white 설정
      this.alpha = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/img/selecting.png',
              fit: BoxFit.cover,
              width: 300,
            ), // 배경 이미지 추가
          ),
          Positioned.fill(
            child: Snowflakes(
              numberOfSnowflakes: numberOfSnowflakes,
              color: color, // 여기서 위젯의 color 속성 사용
              alpha: alpha,
            ),
          ),
          Positioned.fill(child: child),
        ],
      );
}

class SnowfallWidget3 extends StatelessWidget {
  final Widget child;
  final Color color;
  final int numberOfSnowflakes;
  final int alpha;

  const SnowfallWidget3(
      {Key? key,
      required this.child,
      this.numberOfSnowflakes = 50,
      this.color = Colors.white, // 기본 색상 값으로 Colors.white 설정
      this.alpha = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      Positioned.fill(
        child: Image.asset(
          'assets/img/cloud.gif',
          fit: BoxFit.cover,
          width: 300,
        ), // 배경 이미지 추가
      ),
      Positioned.fill(
        child: Snowflakes(
          numberOfSnowflakes: numberOfSnowflakes,
          color: color, // 여기서 위젯의 color 속성 사용
          alpha: alpha,
        ),
      ),
      Positioned.fill(child: child),
    ],
  );
}