import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/new_task_screen.dart';

void main() {
  runApp(const MyApp()); // App entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5 ToDo',

      // App theme and global styling
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(), // Use Poppins font
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent), // Main theme color
        useMaterial3: true, // Material 3 design
      ),

      home: const HomeScreen(), // First screen

      routes: {
        '/new': (context) => const NewTaskScreen(), // Route to create new tasks
      },
    );
  }
}