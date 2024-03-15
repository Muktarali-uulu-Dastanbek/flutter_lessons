import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/first_image.png'),
          Container(
            height: 200,
            width: 500,
            color: Colors.red,
            // decoration: BoxDecoration(
            //   color: Colors.red,
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage(
            //       "assets/images/love_is.webp",
            //     ),
            //   ),
            // ),
            child: Image.asset(
              "assets/images/love_is.webp",
              fit: BoxFit.fitWidth,
            ),
          ),
          // Image.network(
          //   'https://img.freepik.com/free-photo/a-cupcake-with-a-strawberry-on-top-and-a-strawberry-on-the-top_1340-35087.jpg',
          //   // loadingBuilder: (_, __, ___) {
          //   //   return CircularProgressIndicator();
          //   // },
          // ),
          CachedNetworkImage(
            imageUrl:
                "https://img.freepik.com/free-photo/a-cupcake-with-a-strawberry-on-top-and-a-strawberry-on-the-top_1340-35087.jpg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
