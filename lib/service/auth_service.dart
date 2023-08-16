import 'package:blackrose/main.dart';

class AuthService {
  static Future signUp({
    required String email,
    required String password,
  }) async {
    final response = supabase.auth.signUp(email: email, password: password);
    // if (respons) {
    //   print("Sign in successful");
    // } else {
    //   print("Sign in error???");
    // }
  }
}
