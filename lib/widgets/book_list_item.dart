import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final String title;
  final String author;
  const BookListItem({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.menu_book),
      title: Text(title, textDirection: TextDirection.rtl),
      subtitle: Text(author, textDirection: TextDirection.rtl),
      onTap: () {},
    );
  }
}
