import 'dart:convert';

import 'package:carros_app/domain/response.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<Response> login(String login, String senha) async {
    var url = 'http://livrowebservices.com.br/rest/login';
    final response =
        await http.post(url, body: {'senha': senha, 'login': login});
    final s = response.body;
    print(s);

    // função decode vai receber a String s, retornando um map
    // Map<String,dynamic> a chave e a string/ tipo qualquer coisa
    // conversão da String de retorno http em um hashMap
    //final Map<String, dynamic> map = json.decode(s);

    final r = Response.fromJson(json.decode(s));


    return r;
  }
}
