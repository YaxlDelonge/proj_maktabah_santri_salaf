import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LibraryService {
  Future<String> getAppDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/pdfs";
  }

  Future<List<File>> listBooks() async {
    final path = await getAppDir();
    final pdfDir = Directory(path);
    if (!pdfDir.existsSync()) {
      pdfDir.createSync(recursive: true);
    }
    return pdfDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith(".pdf"))
        .toList();
  }

  Future<File> addBook(File sourceFile) async {
    final path = await getAppDir();
    final pdfDir = Directory(path);
    if (!pdfDir.existsSync()) {
      pdfDir.createSync(recursive: true);
    }
    final newFile = File("${pdfDir.path}/${sourceFile.uri.pathSegments.last}");
    return sourceFile.copy(newFile.path);
  }

  Future<void> deleteBook(File file) async {
    if (file.existsSync()) {
      await file.delete();
    }
  }
}
