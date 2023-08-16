import 'package:blackrose/service/google_signin_api.dart';
import 'package:flutter/material.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key, required this.user});
  final String user;
  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.user),
          ElevatedButton(onPressed: logout, child: Text("Logout")),
        ],
      ),
    );
  }

  Future logout() async {
    await GoogleSignInApi.logout();
    Navigator.of(context).pop();
  }
}
