import 'dart:math';

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
      home: Screen4(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "1",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("test");
        },
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int counter = 0;

  @override
  void initState() {
    counter = 20;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    counter = 100;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Screen2 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "$counter",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          counter++;
          setState(() {});
        },
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late double height;
  late double width;

  // List<Color> randomColorsList = [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.black,
  // ];

  // late int randomIndex;

  int color1 = Random().nextInt(256);
  int color2 = Random().nextInt(256);
  int color3 = Random().nextInt(256);

  @override
  void initState() {
    height = Random().nextInt(500).toDouble();
    width = Random().nextInt(500).toDouble();
    super.initState();
    // randomIndex = Random().nextInt(randomColorsList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          height: height,
          width: width,
          color: Color.fromRGBO(color1, color2, color3, 1),
          // color: randomColorsList[randomIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          height = Random().nextInt(500).toDouble();
          width = Random().nextInt(500).toDouble();
          // randomIndex = Random().nextInt(randomColorsList.length);
          setState(() {
            color1 = Random().nextInt(256);
            color2 = Random().nextInt(256);
            color3 = Random().nextInt(256);
          });
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool isobsecureText = true;
  bool isActiveButton = false;

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (value) {
                if (value.length == 6) {
                  isActiveButton = true;
                } else {
                  isActiveButton = false;
                }
                setState(() {});
              },
              obscureText: isobsecureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if(controller.text.isNotEmpty&&controller2.text.isNotEmpty){
                    }
                    isobsecureText = !isobsecureText;
                    setState(() {});
                  },
                  icon: Icon(
                      isobsecureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: controller2,
            ),
            SizedBox(height: 50),
            Container(
              height: 60,
              width: 150,
              color:
                  isActiveButton ? Colors.green : Colors.green.withOpacity(0.5),
              // child: Text("Отправить"),
            )
          ],
        ),
      ),
    );
  }
}
