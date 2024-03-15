import 'package:flutter/foundation.dart';
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
        useMaterial3: false,
      ),
      home: Screen5(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView Example"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        physics: BouncingScrollPhysics(),
        // physics: NeverScrollableScrollPhysics(
        //   parent: BouncingScrollPhysics(),
        // ),
        // padding: EdgeInsets.all(50),
        // reverse: true,
        // scrollDirection: Axis.horizontal,

        child: Column(
          children: [
            RedContainer(),
            BlueContainer(),
            BlackContainer(),
            PurpleContainer(),
            RedContainer(),
          ],
        ),
      ),
    );
  }
}

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.purple,
    );
  }
}

class BlackContainer extends StatelessWidget {
  const BlackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.black,
    );
  }
}

class BlueContainer extends StatelessWidget {
  const BlueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
    );
  }
}

class RedContainer extends StatelessWidget {
  const RedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Example"),
        centerTitle: true,
      ),
      body: ListView(
        //==singlechld + Column
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        // reverse: true,
        // padding: EdgeInsets.zero,
        // padding: EdgeInsets.only(top: 50),
        children: [
          RedContainer(),
          BlueContainer(),
          BlackContainer(),
          PurpleContainer(),
          RedContainer(),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chars = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView builder Example"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chars.length,
        itemBuilder: (context, index) {
          return Container(
            // margin: EdgeInsets.symmetric(vertical: 20),
            height: 200,
            width: 200,
            color: Colors.red,
            child: Text(
              "${chars[index]}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 200,
            color: Colors.black,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Example"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text(
            "text1",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            // color: Colors.yellow,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
              // shrinkWrap: true,
              children: [
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            // color: Colors.yellow,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
              // shrinkWrap: true,
              children: [
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            // color: Colors.yellow,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
              // shrinkWrap: true,
              children: [
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 60,
                  width: 150,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
