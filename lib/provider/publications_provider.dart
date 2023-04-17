import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../dtos/request/post_request.dart';

class PublicationsProvider extends ChangeNotifier {
  final logger = Logger();
  bool isLoading = true;

  List<PostRequestDto> _publications = [];
  List<dynamic> get publications => _publications;

  Future GetPublications() async {
    final response = await http.get(
      Uri.parse("https://powerfulmind.up.railway.app/publicacion/searchAll"),
    );
    if (response.statusCode == 201) {
      final List<dynamic> data = jsonDecode(response.body);
      _publications = data.map((e) => PostRequestDto.fromJson(e)).toList();
      isLoading = false;
      logger.d('Publications: $data');
      print(_publications);

      notifyListeners();
    } else {
      throw Exception('Publications  error ');
    }
  }
}
