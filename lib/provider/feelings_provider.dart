import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../dtos/request/sentimientos_request.dart';

class FeelingsProvider extends ChangeNotifier {
  final logger = Logger();
  bool isLoading = true;

  List<StateEmotionalRequestDto> _feelings = [];

  List<dynamic> get feelings => _feelings;

  Future GetFeelings() async {
    final response = await http.get(
        Uri.parse(
            "https://powerfulmind.up.railway.app/estadoEmocional/searchAll"),
        );
    if (response.statusCode == 201)
    {
     final List<dynamic> data = jsonDecode(response.body);
     _feelings = data.map((e) => StateEmotionalRequestDto.fromJson(e)).toList();
      isLoading = false;
      logger.d('Feelings: $data');
       notifyListeners();
        } else { throw Exception('Feelings  error '); }
  }
}
