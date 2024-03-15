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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: false,
      ),
      home: App1(),
    );
  }
}

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            // controller: TextEditingController(),
            onChanged: (value) {
              // if (value.length < 5) {
              //   isbuttonActive = false;
              // } else {
              //   isbuttonActive = true;
              // }
              print("value=$value");
            },

            style: TextStyle(fontSize: 20),

            textAlign: TextAlign.end,

            // readOnly: true,

            showCursor: true,

            // obscureText: true,

            obscuringCharacter: "*",

            maxLines: 2,

            // maxLength: 14,

            // cursorHeight: 40,

            // enabled: false,

            cursorColor: Colors.red,

            // keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              // filled: true,
              // fillColor: Colors.blue,
              // enabled: true,
              contentPadding: EdgeInsets.only(left: 50),
              // label: Icon(Icons.star),
              labelText: "labelText",
              // labelStyle: TextStyle(fontSize: 40),

              hintText: "FIO",
              // hintStyle: TextStyle(fontSize: 40),

              // prefixIcon: Icon(Icons.ac_unit),
              // prefix: Icon(Icons.ac_unit),
              prefixText: "+996",
              suffixIcon: Icon(Icons.close),

              // counterText: "1234",
              // helperText: "ФИО",
              // errorText: "Field is required",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black, width: 5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
