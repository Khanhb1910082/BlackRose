import 'package:blackrose/main.dart';
import 'package:blackrose/service/auth_service.dart';
import 'package:blackrose/service/google_signin_api.dart';
import 'package:blackrose/view/page/login/logout.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            ElevatedButton(onPressed: signIn, child: Text("login with google")),
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("sign in failed")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(user.toString())));
      print(user);
      await supabase.auth.signUp(email: user.email, password: "password");
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => LogoutView(user: user.email)));
    }
  }
}
