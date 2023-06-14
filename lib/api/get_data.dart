import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class GetDataPage extends StatefulWidget {
  @override
  _GetDataPageState createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  final String apiUrl = 'http://127.0.0.1:8000/quiz/';

  @override
  void initState() {
    super.initState();
    fetchDataAndSaveToFile();
  }

  Future<void> fetchDataAndSaveToFile() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/assets/data/quiz.json';

        final file = File(filePath);
        await file.writeAsString(response.body);

        print('Данные успешно сохранены в файл: $filePath');
      } else {
        print('Ошибка при получении данных: ${response.statusCode}');
      }
    } catch (e) {
      print('Ошибка при выполнении запроса: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'),
      ),
      body: Center(
        child: Text('Данные загружаются при запуске приложения'),
      ),
    );
  }
}
