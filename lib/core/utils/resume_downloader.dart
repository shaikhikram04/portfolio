import 'resume_downloader_stub.dart'
    if (dart.library.html) 'resume_downloader_web.dart'
    as impl;

Future<bool> downloadResume({
  required String filePath,
  required String fileName,
}) {
  return impl.downloadResume(filePath: filePath, fileName: fileName);
}
