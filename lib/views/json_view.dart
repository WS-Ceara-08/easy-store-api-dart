import 'dart:convert';
import 'package:shelf/shelf.dart';

// Classe responsável por renderizar respostas JSON
class JsonView {
  // Renderiza uma resposta JSON com dados fornecidos
  static Response render(Map<String, dynamic> data) {
    return Response(200,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  }

  // Renderiza uma resposta JSON de erro com mensagem e detalhes do erro
  static Response renderError(String message, String error,
      {int statusCode = 500}) {
    return Response(statusCode,
        body: jsonEncode({'message': message, 'error': error}),
        headers: {'Content-Type': 'application/json'});
  }
}