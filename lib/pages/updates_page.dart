import 'package:flutter/material.dart';
import 'package:proj_maktabah_santri_salaf/l10n/gen/app_localizations.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key}); // <- const constructor

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Center(child: Text(t.updatesLatest));
  }
}
