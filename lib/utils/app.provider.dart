import 'package:blackrose/view/page/shared/dark_mode.dart';
import 'package:blackrose/view/page/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider(AppTheme.lightTheme)),
  ];
}
