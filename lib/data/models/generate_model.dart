import 'dart:io';

final listFile = [
  'user/login_model.dart',
  'user/user_model.dart',
];

Future gen() async {
  Directory current = Directory.current;
  listFile.forEach((element) async {
    File _file = File('${current.path}/lib/data/models/$element');
    String fileString = await _file.readAsString();
    fileString = fileString.trim();
    if (fileString.isNotEmpty && fileString.endsWith('}') && fileString.contains('@JsonSerializable')) {
      fileString = fileString.substring(0, fileString.length - 1);
      final className = fileString
          .substring(fileString.indexOf('class') + 6, fileString.indexOf('{', (fileString.indexOf('class') + 6)))
          .trim();

      if (fileString.contains('$className.fromJson') || fileString.contains('${className}ToJson')) {
        return;
      }

      final factoryFromJson =
          """factory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);""";
      final factoryToJson = """Map<String, dynamic> toJson() => _\$${className}ToJson(this);""";

      await _file.writeAsString('''$fileString
  $factoryFromJson
  $factoryToJson
}''');
    }
  });
}

void start() async {
  try {
    print("run start");
    await gen();
  } catch (e) {
    print('error');
  }
}

main() {
  start();
}
