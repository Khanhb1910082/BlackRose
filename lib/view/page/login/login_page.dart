import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:blackrose/service/google_signin_api.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:blackrose/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  /// Function to generate a random 16 character string.
  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  Future<AuthResponse> signInWithGoogle() async {
    // Just a random string
    final rawNonce = _generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    /// TODO: update the client ID with your own
    ///
    /// Client ID that you registered with Google Cloud.
    /// You will have two different values for iOS and Android.
    final clientId = Platform.isIOS
        ? '1084608411331-49983s9pmtsbrhhlk9ulvput5bcjfjoe.apps.googleusercontent.com'
        : '1084608411331-66dj4j4n5mj95umrp9s9tgg0pq8u8kmu.apps.googleusercontent.com';
    // const applicationId = 'com.example.blackrose';
    /// reverse DNS form of the client ID + `:/` is set as the redirect URL
    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    /// Fixed value for google login
    const discoveryUrl =
        'https://accounts.google.com/.well-known/openid-configuration';

    const appAuth = FlutterAppAuth();

    // authorize the user by opening the concent page
    final result = await appAuth.authorize(
      AuthorizationRequest(
        clientId,
        redirectUrl,
        discoveryUrl: discoveryUrl,
        nonce: hashedNonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    if (result == null) {
      throw 'No result';
    }

    // Request the access and id token to google
    final tokenResult = await appAuth.token(
      TokenRequest(
        clientId,
        redirectUrl,
        authorizationCode: result.authorizationCode,
        discoveryUrl: discoveryUrl,
        codeVerifier: result.codeVerifier,
        nonce: result.nonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    final idToken = tokenResult?.idToken;

    if (idToken == null) {
      throw 'No idToken';
    }

    return supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      nonce: rawNonce,
    );
  }
// testing

//testing
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: width / 12),
            padding: const EdgeInsets.all(15),
            child: Image(
              image: const AssetImage("assets/images/blackRose_logo.png"),
              alignment: Alignment.center,
              width: width * 6 / 7.5,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  // onTap: () {
                  //   Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(builder: (_) => const NavigateUI()));
                  // },
                  onTap: signInWithGoogle,
                  child: Center(
                    child: _loginWith("Google"),
                  ),
                ),
                Center(
                  child: _loginWith("Facebook"),
                ),
                Center(
                  child: _loginWith("số điện thoại"),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  _loginWith(String platform) {
    double widthDevice = MediaQuery.of(context).size.width;
    var img = "";
    if (platform != 'số điện thoại') {
      img = platform.toLowerCase();
    } else {
      img = 'phone-call';
    }
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: widthDevice,
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 2))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/$img.svg',
                height: img == 'google' ? 30 : 33),
            const SizedBox(width: 5),
            Text(
              "Đăng nhập với $platform",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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
          .showSnackBar(SnackBar(content: Text("sign in success")));
    }
  }
}
