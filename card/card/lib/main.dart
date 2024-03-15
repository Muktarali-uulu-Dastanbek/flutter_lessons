import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Screen2(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Card(
                // margin: EdgeInsets.all(50),
                // borderOnForeground: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 20),
                ),
                shadowColor: Colors.blue,
                elevation: 20,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "ITC",
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
            ),

            ////22222/////

            RichText(
              text: TextSpan(
                text: "Dastan",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Muktarali uulu",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "D",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 40,
                ),
                children: [
                  TextSpan(
                    text: "a",
                    style: TextStyle(color: Colors.black),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 10),
                  ),
                  TextSpan(
                    text: "st an    ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "ITC Bootcamp",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(4),
          color: Colors.green,
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Titlecard(
                  title: "Терминалы",
                ),
              ),
              Expanded(
                child: Titlecard(
                  title: "Офисы",
                  isSelected: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Titlecard extends StatelessWidget {
  final bool isSelected;
  final String title;
  const Titlecard({
    super.key,
    this.isSelected = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      color: isSelected ? Colors.red : Colors.black,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class Titlecard2 extends StatefulWidget {
  final bool isSelected;
  final String title;
  const Titlecard2({
    super.key,
    this.isSelected = false,
    required this.title,
  });

  @override
  State<Titlecard2> createState() => _Titlecard2State();
}

class _Titlecard2State extends State<Titlecard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      color: widget.isSelected ? Colors.red : Colors.black,
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
