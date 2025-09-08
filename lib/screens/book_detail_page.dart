import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final int year;

  const BookDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '$author • $year',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(height: 32),
            const Text(
              'وصف مختصر للكتاب… (deskripsi singkat)',
              textAlign: TextAlign.right,
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: () {
                // nanti bisa diarahkan ke PDF reader
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reader belum dihubungkan')),
                );
              },
              icon: const Icon(Icons.menu_book),
              label: const Text('قرأ الآن / Baca sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

