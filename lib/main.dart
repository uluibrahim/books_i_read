import 'package:books_i_read/core/constants/app/application_constants.dart';
import 'package:books_i_read/core/init/theme/theme_notifier.dart';
import 'package:books_i_read/locator.dart';
import 'package:books_i_read/screen/home/view/home_page.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator;
  runApp(
    EasyLocalization(
      path: 'assets/language',
      supportedLocales: const [Locale("tr", "TR")],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: ApplicationConstants.appName,
            theme: theme.currentTheme,
            home: ChangeNotifierProvider(
              create: (context) => HomeViewmoel(),
              child: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
