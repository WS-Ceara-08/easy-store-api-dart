import 'dart:convert';

class FucionariosModels {
  int? idFucioanario;
  String nomeFucionario;
  String senhaFucionario;
  String cargoFucionario;

  FucionariosModels({
      this.idFucioanario,
      required this.nomeFucionario,
      required this.senhaFucionario,
      required this.cargoFucionario
    });

  Map<String, dynamic> toMap() {
    return {
      "idFucioanario": idFucioanario,
      "nomeFucionario": nomeFucionario,
      "senhaFucionario": senhaFucionario,
      "cargoFucionario": cargoFucionario,
    };
  }

  factory FucionariosModels.fromMap(Map<String, dynamic> dados) {
    return FucionariosModels(
        idFucioanario: dados['idFucionario'],
        nomeFucionario: dados["nomeFucionario"],
        senhaFucionario: dados["senhaFucionario"],
        cargoFucionario: dados['cargoFucionario']);
  }

  String toJson() => json.encode(toMap());

  factory FucionariosModels.fromjson(dados){
   return FucionariosModels.fromMap(jsonDecode(dados));
  }
}
