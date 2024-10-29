import 'package:mysql1/mysql1.dart';

class Server {
  // Configurações de conexão com o banco de dados
  ConnectionSettings settings = ConnectionSettings(
      host: String.fromEnvironment('DbHost'),
      port: int.fromEnvironment('DbPort'),
      user: String.fromEnvironment('DbUser'),
      password: String.fromEnvironment('DbPass'),
      db: String.fromEnvironment('Db'));

  MySqlConnection? connection;

  // Método para conectar ao banco de dados
  Future<MySqlConnection?> connect() async {
    try {
      connection ??= await MySqlConnection.connect(settings);
      print('Conexão concluida com sucesso');
    } catch (e) {
      connection = null;
      print('Conexão falhou');
    } finally {
      // ignore: control_flow_in_finally
      return connection;
    }
  }

  // Método para fechar a conexão com o banco de dados
  Future<void> close() async {
    try {
      if (connection != null) {
        await connection!.close();
      }
      print('Conexão fechada com sucesso');
    } catch (e) {
      print('Conexão não conseguiu fechar');
    } finally {
      connection = null;
    }
  }
}