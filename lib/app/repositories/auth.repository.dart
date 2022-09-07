import 'package:stronzotpfmobile/app/models/auth.model.dart';
import 'package:stronzotpfmobile/shared/repository_base.dart';

class AuthRepository extends RepositoryBase {
  AuthRepository() : super();

  Future<AuthResponse> authenticate(String username, String password) async {
    var response = await dio.post(
      '/api/v1/auth',
      data: <String, String>{
        'email': username,
        'password': password,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return AuthResponse.fromJson(response.data);
    }

    throw Exception('Falha ao autenticar :( - ${response.statusCode}');
  }
}
