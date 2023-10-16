import 'package:flutter/material.dart';
import 'package:foodpanda_clone/viewmodels/cuisine_view_model.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_viewmodel.dart';
import 'package:foodpanda_clone/views/home/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}
