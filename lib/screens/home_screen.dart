import 'package:flutter/material.dart';
import 'package:proj_maktabah_santri_salaf/l10n/gen/app_localizations.dart';

// Batasi simbol yang diimpor supaya tak ada tabrakan
import '../pages/library_page.dart' show LibraryPage;
import '../pages/new_books_page.dart' show NewBooksPage;
import '../pages/updates_page.dart' show UpdatesPage;
import '../pages/advanced_search_page.dart' show AdvancedSearchPage;

import 'settings_page.dart';

class HomeScreen extends StatefulWidget {
  final void Function(Locale) onChangeLocale;
  final Locale currentLocale;

  final void Function(ThemeMode) onChangeTheme;
  final ThemeMode themeMode;

  const HomeScreen({
    super.key,
    required this.onChangeLocale,
    required this.currentLocale,
    required this.onChangeTheme,
    required this.themeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  // Semua halaman punya const constructor → boleh pakai const di sini
  late final List<Widget> _pages = const [
    LibraryPage(),
    NewBooksPage(),
    UpdatesPage(),
    AdvancedSearchPage(),
  ];

  Future<void> _openSettings() async {
    // Buka halaman Pengaturan dan tunggu hasilnya (locale & themeMode)
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => SettingsPage(
          currentLocale: widget.currentLocale,
          themeMode: widget.themeMode,
        ),
      ),
    );

    if (result == null) return;

    final Locale? newLocale = result['locale'] as Locale?;
    final ThemeMode? newTheme = result['theme'] as ThemeMode?;

    if (newLocale != null) widget.onChangeLocale(newLocale);
    if (newTheme != null) widget.onChangeTheme(newTheme);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      // start-drawer → otomatis kanan saat RTL, kiri saat LTR
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Center(
                child: Text(
                  t.drawerMenu,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(t.drawerProfile),
            ),
            ListTile(
              leading: const Icon(Icons.tune),
              title: Text(t.drawerPreferences),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(t.drawerSettings),
              onTap: () async {
                Navigator.of(context).pop(); // tutup drawer dulu
                await _openSettings();
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: Text(t.appTitle),
        // biarkan leading kosong agar hamburger muncul otomatis
        actions: [
          IconButton(
            tooltip: t.drawerSettings,
            icon: const Icon(Icons.settings),
            onPressed: _openSettings, // akses cepat ke Pengaturan
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),

      body: IndexedStack(index: _index, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.book_rounded), label: t.navLibrary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.library_books_rounded),
              label: t.navNewBooks),
          BottomNavigationBarItem(
              icon: const Icon(Icons.refresh_rounded), label: t.navUpdates),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search_rounded),
              label: t.navAdvancedSearch),
        ],
      ),
    );
  }
}
