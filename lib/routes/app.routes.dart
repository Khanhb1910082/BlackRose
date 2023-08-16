import 'package:blackrose/view/screens.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String settingRoute = "/profile/setting";
  // static const String switchRoute = "/login";
  static final routes = {
    loginRoute: (context) => const LoginView(),
    settingRoute: (context) => const SettingView(),
  };
}
