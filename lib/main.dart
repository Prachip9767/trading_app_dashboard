import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app_dashboard/custom_widget/navigation_widget.dart';
import 'package:trading_app_dashboard/utils/bloc.dart';
import 'package:trading_app_dashboard/utils/bloc_events.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => MyBloc()..add(LoadData()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme:  ThemeData.dark().copyWith(
        cardTheme: const CardTheme(
          color: Color(0xFF252A30),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF252A30),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: const Color(0xFF4597FF),
          unselectedItemColor: Colors.grey.shade600,
          backgroundColor: Colors.black,
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme
      home: const MyHomePage(),
    );
  }
}
