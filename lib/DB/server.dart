import 'package:mysql1/mysql1.dart';

class Server {
  ConnectionSettings settings = ConnectionSettings(
      host: String.fromEnvironment('DbHost'),
      port: int.fromEnvironment('DbPort'),
      user: String.fromEnvironment('DbUser'),
      password: String.fromEnvironment('DbPass'),
      db: String.fromEnvironment('Db'));

  MySqlConnection? connection;

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

  Future<void> close() async {
    try {
      if (connection != null) {
        await connection!.close();
        connection = null;
      }
      print('Conexão fechada com sucesso');
    } catch (e) {
      print('Conexão não conseguiu fechar');
    }
  }
}
