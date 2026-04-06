import 'package:web/web.dart' as web;

Future<bool> downloadResume({
  required String filePath,
  required String fileName,
}) async {
  try {
    final anchor = web.HTMLAnchorElement()
      ..href = filePath
      ..download = fileName
      ..style.display = 'none';

    web.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return true;
  } catch (_) {
    return false;
  }
}
