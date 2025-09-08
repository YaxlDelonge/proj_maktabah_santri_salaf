import 'package:flutter/material.dart';

class BookmarkItem extends StatelessWidget {
  final String kitab;
  final int page;
  const BookmarkItem({super.key, required this.kitab, required this.page});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(kitab, textDirection: TextDirection.rtl),
        subtitle: Text("Halaman $page", textDirection: TextDirection.rtl),
      ),
    );
  }
}
