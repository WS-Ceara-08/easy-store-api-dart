import 'package:mysql1/mysql1.dart';

class Server {
  ConnectionSettings settings = ConnectionSettings(
    host: String.fromEnvironment('DbHost'),
    //etc....
  );
}
