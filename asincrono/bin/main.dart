import 'dart:io';
import 'dart:convert';

main() {
  int zlib_comp = testCompress(zlib);
  int gzip_comp = testCompress(gzip);

  print(zlib_comp);
  print(gzip_comp);
}

String generateData() {
  String data = '';
  for (int i=0; i < 1000; i++) {
    data = data + 'Olá Dart que bai virar flutter\n';
  }
  return data;
}

int testCompress(var codec) {
  String data = generateData();

  List original = utf8.encode(data);
  List compressed = codec.encode(data);
  List decompressed = codec.decode(data);

  print('Testandi: ${codec.toString()}');
  print('Original: ${original.length} bytes');
  print('compressed: ${compressed.length} bytes');
  print('decompressed: ${decompressed.length} bytes');

  print('');

  String decoded = utf8.decode(decompressed);
  assert(data == decoded);

  return compressed.length;
}