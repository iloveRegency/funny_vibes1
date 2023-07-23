import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyVibesApp());
}

class FunnyVibesApp extends StatelessWidget {
  const FunnyVibesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Set a primary swatch for the theme
        // The 'fromSwatch' method should be used instead of 'fromSeed'
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> GGList = [
    'There are no mistakes, only opportunities มันคือโอกาส มันไม่ใช่ความผิดพลาด',
    'The best way to predict your future is to create it อยากรู้ไหมว่าอนาคตจะเป็นยังไง? ก็ลองทำอะไรบางอย่างในวันนี้ดูสิ!',
    'Don’t cry because it’s over, smile because it happened อย่าเสียใจเพียงเพราะมันจบลงเลย อย่างน้อยครั้งหนึ่งมันก็สร้างความสุขให้เรามากมาย',
    'Don’t let your dreams be dreams อย่ายอมให้ "ความฝัน" เป็นแค่ "ความฝัน"',
    'If you don’t fight for what you want, don’t cry for what you lost ถ้าไม่สู้เพื่อสิ่งที่ตัวเองต้องการ ก็อย่าเสียเวลาร้องไห้เมื่อคุณเสียมันไป',
  ];

  var GG = GGList[0]; // state variable
  Color currentColor = Colors.redAccent; // Set initial color

  void handleClickGo() {
    setState(() {
      var rand = Random();
      // Randomize quote
      var randomQuoteIndex = rand.nextInt(GGList.length);
      while (GGList[randomQuoteIndex] == GG) {
        randomQuoteIndex = rand.nextInt(GGList.length);
      }
      GG = GGList[randomQuoteIndex];

      // Randomize color
      List<Color> availableColors = [
        Colors.pink,
        Colors.orange,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.purple,
        Colors.red,
        Colors.teal,
        Colors.indigo,
        Colors.amber,
      ];
      availableColors.remove(currentColor);
      var randomColorIndex = rand.nextInt(availableColors.length);
      currentColor = availableColors[randomColorIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quote of the Day')),
      floatingActionButton: FloatingActionButton(
        child: const Text('NEXT'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            GG,
            style: TextStyle(
              color: currentColor,
              fontSize: 35,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
