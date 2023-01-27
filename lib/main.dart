import 'package:flutter/material.dart';
import 'package:spinwheel/screens/spin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[900])),
          appBarTheme: AppBarTheme(color: Colors.deepPurple[900]),
          // primarySwatch: Colors.deepPurple,
        ),
        home: SpinScreen());
  }
}
