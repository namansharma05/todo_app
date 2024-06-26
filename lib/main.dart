import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_page.dart';

var xColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 142, 123),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: xColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: xColorScheme.onPrimaryContainer,
          foregroundColor: xColorScheme.primaryContainer,
        ),
        scaffoldBackgroundColor: xColorScheme.secondaryContainer,
        cardTheme: const CardTheme().copyWith(
          color: xColorScheme.secondary,
        ),
        textTheme: const TextTheme().copyWith(
          bodyLarge: TextStyle(color: xColorScheme.secondaryContainer),
        ),
        checkboxTheme: const CheckboxThemeData().copyWith(
          fillColor: WidgetStatePropertyAll(xColorScheme.secondaryContainer),
          checkColor: WidgetStatePropertyAll(xColorScheme.onPrimaryContainer),
        ),
      ),
      home: const HomePage(),
    );
  }
}
