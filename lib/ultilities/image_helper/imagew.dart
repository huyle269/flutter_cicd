import 'dart:async';
import 'dart:io';
// import 'package:recase/recase.dart';
import 'package:path/path.dart';

Future<int> gen(List<String> folders) async {
  Directory current = Directory.current;

  File _file = File('${current.path}/lib/ultilities/image_helper/asset_helper.dart');

  String properties = '';
  int total = 0;

  Map<String, bool> mark = {};

  for (int i = 0; i < folders.length; i++) {
    String folderName = folders[i];
    properties += '\n\t//Assets in $folderName\n';
    String dir = '${current.path}/assets/$folderName';
    List<FileSystemEntity> files = await getFilesInDir(Directory(dir));
    files.sort((a, b) => a.path.compareTo(b.path));

    for (int j = 0; j < files.length; j++) {
      FileSystemEntity e = files[j];
      String _property = basenameWithoutExtension(e.path); //.camelCase;
      String path = 'assets/$folderName/${basename(e.path)}';
      String property = _property;
      int count = 1;
      while (mark[property] == true) {
        property = '$_property$count';
        count++;
      }
      mark[property] = true;
      final typeFile = path.substring(path.lastIndexOf('.') + 1, path.length);
      properties += """\tstatic const String ${property + '_' + typeFile} = '$path';\n""";
    }
    total += files.length;
  }
  await _file.writeAsString('''
mixin AssetHelper {$properties}''');
  return total;
}

Future<List<FileSystemEntity>> getFilesInDir(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file),
      // should also register onError
      onDone: () => completer.complete(files));
  return completer.future;
}

Future<void> start() async {
  print('***[AssetHelper] STARTED ***');
  List<String> folders = ['icons', 'images']; //, 'images/intro','icons/bank_logo'];
  int total = await gen(folders);
  print('***[AssetHelper] GENERATED ${folders.length} folders and $total files ***');
}

main() {
  start();
}
