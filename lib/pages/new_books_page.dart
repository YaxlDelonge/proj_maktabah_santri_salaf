import 'package:flutter/material.dart';
import 'package:proj_maktabah_santri_salaf/l10n/gen/app_localizations.dart';

class NewBooksPage extends StatelessWidget {
  const NewBooksPage({super.key}); // <- const constructor

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Center(child: Text(t.booksNewList));
  }
}
