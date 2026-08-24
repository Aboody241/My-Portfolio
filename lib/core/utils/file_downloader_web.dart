// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void downloadFile(String url, [String? filename]) {
  final anchor = html.AnchorElement(href: url)
    ..target = '_blank'
    ..download = filename ?? url.split('/').last;
  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}

void openUrl(String url) {
  html.window.open(url, '_blank');
}
