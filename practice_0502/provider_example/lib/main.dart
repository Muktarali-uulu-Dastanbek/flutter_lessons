import 'package:flutter/material.dart';
import 'package:provider_example/features/users/presentation/screens/all_users_screen.dart';
import 'package:provider_example/internal/dependencies/get_it.dart';

void main() {
  configureDependencies();
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
        useMaterial3: true,
      ),
      home: AllUsersScreen(),
    );
  }
}
