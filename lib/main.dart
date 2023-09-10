import 'package:expense_tracker_flutter/widgets/expenses.dart';
import 'package:flutter/material.dart';

var gColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var gDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main(List<String> args) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: gDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: gDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 2,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: gColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: gColorScheme.onPrimaryContainer,
        foregroundColor: gColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: gColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 2,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.green,
              fontSize: 16,
            ),
          ),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
