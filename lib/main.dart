import 'package:flutter/material.dart';
import 'package:snowfall/snowfall.dart';
import 'package:snowman_timer_project/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(widget.title),
//       ),
//       // body: Container(
//       //   color: Colors.white,
//       //   child: SnowfallWidget(
//       //     color: Colors.lightBlueAccent,
//       //     child: Center(
//       //       child: Column(
//       //         mainAxisAlignment: MainAxisAlignment.center,
//       //         children: <Widget>[],
//       //       ),
//       //     ),
//       //   ),
//       // ),
//       body: SplashScreen(),
//     );
//   }
// }
