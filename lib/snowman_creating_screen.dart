import 'package:flutter/material.dart';
import 'package:snowfall/snowfall.dart';
import 'package:snowman_timer_project/snowfall/snowfall_widget.dart';
import 'dart:async';

import 'complete_screen.dart';

class SnowmanCreatingScreen extends StatefulWidget {
  final int duration; // 전달받은 시간
  final String imagePath;

  const SnowmanCreatingScreen({
    Key? key,
    required this.duration,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<SnowmanCreatingScreen> createState() => _SnowmanCreatingScreenState();
}

class _SnowmanCreatingScreenState extends State<SnowmanCreatingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  int displayState = 0;
  bool isGifStart = false;
  late Timer _timer;
  late Duration _duration;
  bool _isTimerRunning = false;
  bool isTimeUp = false;

  Image image = Image.asset('assets/img/pause.png');

  void onScreenTapped() {
    setState(() {
      if (displayState < 2) {
        displayState++; // Increment the display state to change the text/button
        print(displayState);
      } else {
        displayState++;
        isGifStart = true;
        print('start');
        print(displayState);
        controller.forward(); // Start the animation controller
      }

      /// 영민 갓
      if (displayState == 3) {
        startTimer();
      }
    });
  }

  @override
  void initState() {
    print('reere1');

    super.initState();
    _duration = Duration(seconds: 10);
    controller = AnimationController(duration: _duration, vsync: this);

    // Initialize the animation field
    animation = Tween(begin: 0.3, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    _timer = Timer.periodic(
        Duration(seconds: 1), (_) {}); // Dummy timer initialization

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _showCompletionDialog();
      }
    });
  }

  void startTimer() {
    print('reyi');
    _isTimerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        image = Image.asset('assets/img/pause.png');
        if (_duration.inSeconds > 0) {
          _duration -= Duration(seconds: 1);
        } else {
          // timer.cancel();
          // _isTimerRunning = false;
          // controller.forward();
          timer.cancel();
          _isTimerRunning = false;
          isTimeUp = true;
          controller.forward();
          // 시간이 종료되면 눈덩이 크기를 최대치로 설정하고 완성 대화상자를 호출
          setState(() {
            displayState = 3; // 눈덩이 최대 크기로 설정
            // _showCompletionDialog(); // 완성 대화상자 호출
          });
        }
      });
    });
  }

  void pauseTimer() {
    print('meyi');
    setState(() {
      image = Image.asset('assets/img/start.png');
    });

    setState(() {
      print('debug ${_isTimerRunning}');
      if (_isTimerRunning) {
        _timer.cancel();
        _isTimerRunning = false;
        controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

//_timer has not been initialized 에러가난다 해결점
//   void _showCompletionDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('눈사람 완성!'),
//           content: Text('눈사람이 완성되었습니다.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('확인'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => CompleteScreen(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    // if (isGifStart && !_isTimerRunning) {
    //   print('gigi');
    //   print(isGifStart);
    //   // startTimer();
    // }
    return Scaffold(
      body: GestureDetector(
        onTap: onScreenTapped,
        child: SnowfallWidget3(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Transform.scale(
                scale: 1,
                child: Image.asset(
                  'assets/img/tree.gif',
                  fit: BoxFit.cover,
                ),
              ),
              if (!isGifStart) buildTextStack(displayState),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isGifStart)
                      Stack(children: [
                        Column(
                          children: [
                            Text(formatTime(),
                                style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: 'DNFBitBit')),
                            GestureDetector(
                              onTap: () {
                                if (_isTimerRunning) {
                                  pauseTimer();
                                  print(_isTimerRunning);
                                  print('naya');
                                } else {
                                  startTimer();
                                  print(_isTimerRunning);
                                  print('pwya');
                                }
                              },
                              child: image,
                            ),
                          ],
                        ),
                      ]),
                    Transform.translate(
                        offset: getSnowballOffset(displayState),
                        child: Transform.scale(
                          scale: getSnowballScale(displayState),
                          child: Image.asset('assets/img/snowball.gif'),
                        )),
                    // 타이머 종료시 정중앙에 표시되는 버튼
                    // 타이머 종료 시 버튼 표시
                    if (isTimeUp)
                      Positioned(
                        top: 0, // 원하는 위치로 조절
                        left: 0, // 원하는 위치로 조절
                        right: 0, // 원하는 위치로 조절
                        bottom: 200, // 원하는 위치로 조절
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CompleteScreen(
                                  duration:widget.duration,
                                  imagePath:widget.imagePath,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'DONE!',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'DNFBitBit',
                                color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Offset getSnowballOffset(int state) {
    switch (state) {
      case 0:
        return Offset(0, 100); // Adjust the offset for state 0
      case 1:
        return Offset(0, 150); // Adjust the offset for state 1
      case 2:
        return Offset(0, 200); // Adjust the offset for state 2
      default:
        return Offset(0, 0); // Default offset when animation starts
    }
  }

  String formatTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(_duration.inHours)}:${twoDigits(_duration.inMinutes.remainder(60))}:${twoDigits(_duration.inSeconds.remainder(60))}";
  }

  double getSnowballScale(int displayState) {
    if (displayState < 3) {
      switch (displayState) {
        case 0:
          return 0.2;
        case 1:
          return 0.5;
        case 2:
          return 0.7;
        default:
          return 1.0;
      }
    } else {
      return animation.value; // Use animation value when all states are done
    }
  }

  Widget buildTextStack(int state) {
    String text = '';
    switch (state) {
      case 0:
        text = '눈이 구르는 동안\n휴대폰을 만지지 마세요!';
        break;
      case 1:
        text = '눈덩이를 꾹 누르면\n얼마나 더 커져야 하는지\n볼 수 있어요!';
        break;
      case 2:
        text = '눈덩이가 전부 커지면\n눈사람이 만들어져요!';
        break;
    }
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(0, 120),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/img/woodboard.png', fit: BoxFit.cover),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'DNFBitBit',
                    ),
                  ),
                ],
              ),
              Image.asset('assets/img/ok.png'),
            ],
          ),
        ),
      ],
    );
  }
}
