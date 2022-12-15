import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          "there is a problem with the status code ${response.statusCode}");
    }
  }

  Future<dynamic> put({required String url, body}) async {

    http.Response response = await http.put(Uri.parse(url),body: body);

    if(response.statusCode == 200){

      return jsonDecode(response.body);
    }else{

      throw Exception("There is a problem with the status code ${response.statusCode}");
    }
  }

  Future<dynamic> post({required String url,@required dynamic body}) async {

    http.Response response = await http.post(Uri.parse(url),body: body);

    if(response.statusCode == 200){

      return jsonDecode(response.body);

    }else{
      throw Exception("There is a problem with the status code ${response.statusCode}");
    }
  }
}
