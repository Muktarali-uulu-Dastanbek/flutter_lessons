import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Screen3(),
        );
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pppp"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 240,
              width: 240,
              color: Colors.green,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      //Stack(
      //   clipBehavior: Clip.none,
      //   // alignment: Alignment.center,

      //   children: [
      //     Container(
      //       height: 200,
      //       width: 200,
      //       color: Colors.black,
      //     ),
      //     Container(
      //       height: 100,
      //       width: 100,
      //       color: Colors.red,
      //     ),
      //     Positioned(
      //       right: -50,
      //       bottom: 20,
      //       child: Container(
      //         height: 50,
      //         width: 100,
      //         color: Colors.green,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,

      body: Column(
        children: [
          Container(
            height: height * 0.2475,
            color: Colors.black,
          ),
          Container(
            height: height * 0.7525,
            color: Colors.purple,
            padding: EdgeInsets.only(
              top: height * 0.0148,
              left: width * 0.0533,
              right: width * 0.0533,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: height * 0.1293,
                      width: width * 0.2667,
                      color: Colors.white,
                    ),
                    SizedBox(width: width * 0.0445),
                    Container(
                      height: height * 0.1293,
                      width: width * 0.2667,
                      color: Colors.white,
                    ),
                    SizedBox(width: width * 0.0445),
                    Container(
                      height: height * 0.1293,
                      width: width * 0.2667,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 18),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         color: Colors.white,
      //         height: 50,
      //         // width: 340,
      //       ),
      //       SizedBox(height: 20),
      //       // Container(
      //       //   color: Colors.white,
      //       //   height: MediaQuery.of(context).size.height * 0.5,
      //       //   width: MediaQuery.of(context).size.width * 0.7,
      //       //   // width: 340,
      //       // ),
      //       Container(
      //         color: Colors.white,
      //         height: width * 0.5,
      //         width: width * 0.5,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

//h-высота
//w-длина
//sh-высота экрана
//sw-длина экрана, например 1.sw или 0.5.sw
//r-радиус //Icon, Padding если all, BorderRadius
//sp-шрифта

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 201.h,
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            // padding: EdgeInsets.only(top: 12.h, left: 10.w, right: 10.w),
            height: 611.h,
            color: Colors.purple,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 0.3.sh,
                  width: 1.sw,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white,
                      ),
                      height: 105.h,
                      width: 100.w,
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 48.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 26.w),
                    Container(
                      color: Colors.white,
                      height: 105.h,
                      width: 100.w,
                    ),
                    SizedBox(width: 26.w),
                    Container(
                      color: Colors.white,
                      height: 105.h,
                      width: 100.w,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
