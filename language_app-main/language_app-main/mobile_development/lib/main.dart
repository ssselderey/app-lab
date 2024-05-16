import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_development/generated/l10n.dart';
import 'package:mobile_development/controllers/lang_controller.dart';
import 'package:mobile_development/screens/splash.dart';
import 'package:mobile_development/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageController()),
      ],
      child: Consumer<LanguageController>(
        builder: (context, provider, child) {
        return  GetMaterialApp(
          locale: provider.appLocale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('ru'), Locale('en')],
          title: 'Flutter On Boarding',
          theme: Provider.of<ThemeProvider>(context).themeData,
          home: Splash(),
        );
        }
      )
      );
  }
}