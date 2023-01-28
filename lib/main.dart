import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spinwheel/screens/spin_screen.dart';
import 'package:spinwheel/widgets/spin_widget.dart';

void main() async {
  runApp(const MyApp());
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: SpinWidjet());
  }
}
