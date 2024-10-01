import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, required dynamic token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  post({required String url, required Map<String, String> body, required String token}) {}

  put({required String url, required Map<String, String> body, required String token}) {}
}

Future<dynamic> post({
  required String url,
  required dynamic body,
  required String? token,
}) async {
  Map<String, String> headers = {};
  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }
  http.Response response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(
        'Failed to load data ${response.statusCode}with body ${response.body}');
  }
}

Future<dynamic> put({
  required String url,
  required dynamic body,
  required String? token,
}) async {
  Map<String, String> headers = {};
  headers.addAll({
    'Content-Type': 'application/json',
  });
  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }
  http.Response response = await http.put(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(
        'Failed to load data ${response.statusCode}with body ${response.body}');
  }
}
