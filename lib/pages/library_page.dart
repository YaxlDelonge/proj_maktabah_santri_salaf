import 'package:flutter/material.dart';
import '../screens/book_detail_page.dart'; // <— tambahkan import

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = List.generate(10, (i) => {
          'title': 'كتاب رقم ${i + 1}',
          'author': 'المؤلف ${i + 1}',
          'year': 1400 + i,
        });

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: books.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (ctx, i) {
        final b = books[i];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              b['title'] as String,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              '${b['author']} • ${b['year']}',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.chevron_left),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookDetailPage(
                    title: b['title'] as String,
                    author: b['author'] as String,
                    year: b['year'] as int,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

