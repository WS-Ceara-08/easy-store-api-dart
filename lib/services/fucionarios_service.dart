import 'package:easy_store_api_dart/DB/server.dart';
import 'package:easy_store_api_dart/models/fucionarios_models.dart';

class FucionariosService {
  Server db = Server();

  Future<void> addFucionario(FucionariosModels funcionario) async {
    final connection = await db.connect();
    await connection!.query(
        'INSERT INTO Fucionarios(nomeFucionario, senhaFucionario, cargoFucionario) VALUES(? , ?, ?)',
        [
          funcionario.nomeFucionario,
          funcionario.senhaFucionario,
          funcionario.cargoFucionario
        ]);
    db.close();
  }
}