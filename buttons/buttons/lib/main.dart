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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back),
        // leadingWidth: 100,
        actions: [
          Icon(Icons.ac_unit),
          SizedBox(width: 20),
          Icon(Icons.settings),
          PopupMenuButton(
            // icon: Icon(Icons.ac_unit),
            tooltip: "test",
            onSelected: (value) {
              // your logic
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("Hello"),
                  value: '/hello',
                ),
                PopupMenuItem(
                  child: Text("About"),
                  value: '/about',
                ),
                PopupMenuItem(
                  child: Text("Contact"),
                  value: '/contact',
                )
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                // padding: EdgeInsets.all(40),

                // textStyle: TextStyle(fontSize: 50),

                foregroundColor: Colors.red,
                backgroundColor: Colors.blue,
                // primary: Colors.black,
                // fixedSize: Size(400, 400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
                // side: BorderSide(
                //   color: Colors.red,
                //   width: 20,
                // ),
              ),
              onPressed: () {
                print("textButton");
              },
              child: Text(
                "TextButton",
                style: TextStyle(fontSize: 30),
              ),
            ),
            ////////////////////////////////2222////////////////////////////////

            SizedBox(height: 30),
            TextButton.icon(
              onLongPress: () {
                print("onlongpress");
              },
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text("TextButton.Icon"),
              style: TextButton.styleFrom(),
            ),

            ////////////////////3333////////////////////////////////////////////

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: Text("ElevatedButton"),
              style: ElevatedButton.styleFrom(

                      // elevation: 0,

                      // backgroundColor: Colors.black,
                      // foregroundColor: Colors.red, //цвет контента /текста
                      // onPrimary: Colors.yellow,
                      )
                  .copyWith(
                elevation: MaterialStatePropertyAll(0),
                overlayColor: MaterialStatePropertyAll(Colors.black),
              ),
            ),
            ///////////////4444///////////////////////////////////////////////
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text("elevatedButton.icon"),
            ),
////////////////555////////////////
            OutlinedButton(
              onPressed: () {},
              child: Text(
                "OutlinedButton",
              ),
              style: OutlinedButton.styleFrom(
                  // side: BorderSide(color: Colors.transparent),
                  ),
            ),
            ////////////6/////////////
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text("llll"),
            ),
//////77777//////////////////////
            FloatingActionButton(
              backgroundColor: Colors.blue,
              splashColor: Colors.red,
              onPressed: () {},
              child: Icon(Icons.add),
            ),

            FloatingActionButton.extended(
              icon: Icon(Icons.ac_unit),
              onPressed: () {},
              label: Text("ahdfhasfd"),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              splashRadius: 60,
              splashColor: Colors.red,
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
            ),

            InkWell(
              borderRadius: BorderRadius.circular(100),
              highlightColor: Colors.transparent,
              splashColor: Colors.blue,
              onTap: () {
                print("inkwell");
              },
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              // radius: 100,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Icon(
                Icons.ac_unit,
                size: 50,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
