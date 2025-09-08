import 'package:flutter/material.dart';
import 'package:proj_maktabah_santri_salaf/l10n/gen/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  final Locale currentLocale;
  final ThemeMode themeMode;

  const SettingsPage({super.key, required this.currentLocale, required this.themeMode});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Locale _selectedLocale = widget.currentLocale;
  late ThemeMode _selectedTheme = widget.themeMode;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final langs = <(Locale, String)>[
      (const Locale('ar'), 'العربية'),
      (const Locale('id'), 'Bahasa Indonesia'),
      (const Locale('en'), 'English'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(t.settingsTitle)),
      body: ListView(
        children: [
          // bahasa
          ListTile(title: Text(t.settingsChooseLanguage, textAlign: TextAlign.right)),
          ...langs.map((e) => RadioListTile<Locale>(
                value: e.$1,
                groupValue: _selectedLocale,
                onChanged: (v) => setState(() => _selectedLocale = v!),
                title: Text(e.$2, textAlign: TextAlign.right),
              )),

          const Divider(),

          // tema
          const ListTile(title: Text('Tema Aplikasi')),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: _selectedTheme,
            onChanged: (v) => setState(() => _selectedTheme = v!),
            title: const Text('Terang'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: _selectedTheme,
            onChanged: (v) => setState(() => _selectedTheme = v!),
            title: const Text('Gelap'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: _selectedTheme,
            onChanged: (v) => setState(() => _selectedTheme = v!),
            title: const Text('Ikuti Sistem'),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () => Navigator.pop(context, {
                'locale': _selectedLocale,
                'theme': _selectedTheme,
              }),
              child: Text(t.settingsApply),
            ),
          ),
        ],
      ),
    );
  }
}
