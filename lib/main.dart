import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psm/provider/video_provider.dart';
import 'package:psm/screen/detail.dart';
import 'package:psm/screen/menu.dart';
import 'package:psm/screen/search.dart';
import 'package:psm/screen/speech.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VideoProvider()),
    ],
    child: new MaterialApp(
      home: new Menu(),
      initialRoute: '/',
      routes: {
        Search.tag: (context) => Search(),
        Speech.tag: (context) => Speech(),
        Detail.tag: (context) => Detail(),
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSM 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}
