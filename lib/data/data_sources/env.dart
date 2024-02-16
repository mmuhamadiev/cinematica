import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: 'secrets.env')  //Path of your secret.env file
abstract class Env{
  @EnviedField(varName: 'API_KEY')
  static final String apiKey = _Env.apiKey;
}