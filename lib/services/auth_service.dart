import 'package:flutter_auth_roleperm/helpers/constants.dart';
import 'package:http/http.dart';

class AuthService {
  var loginUri = Uri.parse('${Constants.BASE_URL}/auth/signin');
  var registerUri = Uri.parse('${Constants.BASE_URL}/auth/signup');

  Future<Response?> login(String username, String password) async {
    var res = await post(
        loginUri,
        body: {
          "email": username,
          "password": password
        }
    );
    return res;
  }

  Future<Response?> register(String username, String password, String fullname, String phone) async {
    var res = await post(
        registerUri,
        body: {
          "email": username,
          "password": password,
          "fullname": fullname,
          "phone": phone
        }
    );
    return res;
  }
}
