import 'package:blackrose/routes/app.routes.dart';
import 'package:blackrose/utils/app.provider.dart';
import 'package:blackrose/view/page/login/test.dart';
import 'package:blackrose/view/page/register/edit_username.dart';
import 'package:blackrose/view/page/setting/setting_profile/test_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/init_meedu_player.dart';
import 'package:provider/provider.dart';

import 'package:blackrose/view/page/shared/dark_mode.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'view/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://ucsashuewsthddlnyjlw.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVjc2FzaHVld3N0aGRkbG55amx3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAxNzcwNjQsImV4cCI6MjAwNTc1MzA2NH0.9N85ZNrGp6mBZbyJNTRiudTJk8PKxtMPj-LbqDIHQy0",
    // authCallbackUrlHostname: 'login-callback',
  );
  initMeeduPlayer(
    androidUseMediaKit: true,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BlackRose',
            // theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
            theme: themeProvider.getTheme(),
            home: const EditUserNameView(),
            // initialRoute: AppRoutes.loginRoute,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
