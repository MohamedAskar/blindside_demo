import 'package:blindside_demo/screens/Home/home.dart';
import 'package:blindside_demo/screens/login/login_screen.dart';
import 'package:blindside_demo/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blindside Demo',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: LoginScreen(),
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
