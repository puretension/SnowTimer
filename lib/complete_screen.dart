import 'package:flutter/material.dart';
import 'package:snowman_timer_project/collection_screen.dart';
import 'package:snowman_timer_project/snowfall/snowfall.dart';
import 'package:snowman_timer_project/time_select_screen.dart';

class CompleteScreen extends StatelessWidget {
  final int duration;
  final String imagePath;

  const CompleteScreen(
      {Key? key, required this.duration, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = _getDescriptionForDuration(duration);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SnowfallWidget3(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DNFBitBit',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Transform.translate(
                            offset: Offset(0, 50),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: Image.asset(
                                  imagePath,
                                  key: ValueKey<String>(imagePath),
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // 여기에서 TimeSelectScreen으로 이동합니다
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TimeSelectScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset('assets/img/maink.png'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // 여기에서 TimeSelectScreen으로 이동합니다
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CollectionScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset('assets/img/awardk.png'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDescriptionForDuration(int duration) {
    switch (duration) {
      case 1:
        return '기본 눈사람\n단순하지만 따뜻한 미소가 매력이에요.';
      case 2:
        return '중절모 눈사람\n유쾌하고 따뜻한 겨울의 신사에요.';
      case 3:
        return '빨간 모자 눈사람\n빨간 모자를 쓴 귀여운 눈사람이에요.';
      case 4:
        return '안전모 눈사람\n추운 겨울, 안전을 최우선하는 눈사람이에요.';
      case 5:
        return '한복 눈사람\n한복을 입고 즐거운 설날을 기다리고 있어요.';
      case 6:
        return '큐트 눈사람\n손하트를 날리는 눈사람이에요. 정말 귀여워요.';
      case 7:
        return '마술사 눈사람\n마술사가 되고 싶은 눈사람이에요.';
      case 8:
        return '몬스터 눈사람\n몬스터 눈사람은 협찬을 좋아해요.';
      default:
        return '눈사람이 완성되었습니다!';
    }
  }
}
