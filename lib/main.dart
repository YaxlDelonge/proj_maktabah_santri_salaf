import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proj_maktabah_santri_salaf/l10n/gen/app_localizations.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MaktabahApp());

class MaktabahApp extends StatefulWidget {
  const MaktabahApp({super.key});
  @override
  State<MaktabahApp> createState() => _MaktabahAppState();
}

class _MaktabahAppState extends State<MaktabahApp> {
  // Default bahasa & tema
  Locale _locale = const Locale('ar');        // Arabic (RTL)
  ThemeMode _themeMode = ThemeMode.light;     // Light | Dark | System

  void _changeLocale(Locale l) => setState(() => _locale = l);
  void _changeTheme(ThemeMode m) => setState(() => _themeMode = m);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Lokalizasi
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      // Tema
      themeMode: _themeMode,

      // Light theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xfff9f1f7),
      ),

      // Dark theme (AMOLED)
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          background: Colors.black,
          surface: Colors.black,
          primary: Colors.deepPurpleAccent,
          secondary: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey,
        ),
        cardTheme: const CardThemeData(
          color: Colors.black,
          surfaceTintColor: Colors.transparent,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          bodySmall: TextStyle(color: Colors.white60),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white70),
        ),
      ),

      // Home
      home: HomeScreen(
        onChangeLocale: _changeLocale,
        currentLocale: _locale,
        onChangeTheme: _changeTheme,
        themeMode: _themeMode,
      ),
    );
  }
}

