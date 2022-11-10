import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tpf_mobile/app/views/Login.dart';
import 'shared/my_themes.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', '').then((_) => runApp(const ProviderScope(
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Tá Pegando Fogo?',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: Scaffold(
          appBar: AppBar(
              title: const Text(_title),
              backgroundColor: const Color.fromRGBO(230, 60, 66, 1.0)),
          body: Login(),
        ),
      );
}
