import 'package:flutter/material.dart';
import 'package:snowman_timer_project/snowfall/snowfall_widget.dart';
import 'package:snowman_timer_project/snowman_creating_screen.dart';

class TimeImage {
  final String imagePath;
  final int time;

  TimeImage({required this.imagePath, required this.time});
}

class TimeSelectScreen extends StatefulWidget {
  const TimeSelectScreen({super.key});

  @override
  State<TimeSelectScreen> createState() => _TimeSelectScreenState();
}

class _TimeSelectScreenState extends State<TimeSelectScreen> {
  int currentIndex = 0; // 현재 선택된 이미지 인덱스
  final List<TimeImage> timeImages = [
    TimeImage(imagePath: 'assets/img/time1.png', time: 1),
    TimeImage(imagePath: 'assets/img/time2.png', time: 2),
    TimeImage(imagePath: 'assets/img/time3.png', time: 3),
    TimeImage(imagePath: 'assets/img/time4.png', time: 4),
    TimeImage(imagePath: 'assets/img/time5.png', time: 5),
    TimeImage(imagePath: 'assets/img/time6.png', time: 6),
    TimeImage(imagePath: 'assets/img/time7.png', time: 7),
    TimeImage(imagePath: 'assets/img/time8.png', time: 8),
  ];

  void _changeImage(bool isNext) {
    setState(() {
      if (isNext) {
        currentIndex = (currentIndex + 1) % timeImages.length;
      } else {
        currentIndex =
            (currentIndex - 1 + timeImages.length) % timeImages.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SnowfallWidget2(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height, // Fills the screen height
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/img/woodboard.png',
                                    fit: BoxFit.cover),
                                Text(
                                  '${timeImages[currentIndex].time}시간 눈사람',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // OK 이미지 버튼
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SnowmanCreatingScreen(
                                      duration: timeImages[currentIndex].time,
                                      imagePath: timeImages[currentIndex].imagePath,
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset('assets/img/ok.png'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                      'assets/img/left.png'), // 왼쪽 화살표 이미지로 변경
                                  onPressed: () => _changeImage(false),
                                ),
                                Expanded(
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      child: Image.asset(
                                        timeImages[currentIndex].imagePath,
                                        key: ValueKey<int>(
                                            currentIndex), // 애니메이션을 위한 키
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Image.asset(
                                      'assets/img/right.png'), // 오른쪽 화살표 이미지로 변경
                                  onPressed: () => _changeImage(true),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
