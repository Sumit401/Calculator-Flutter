import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/converters_file.dart';
import 'package:project/scientific.dart';
import 'package:window_size/window_size.dart';
import '/basic.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isFuchsia) {
    setWindowTitle('Calculator');
    setWindowMaxSize(const Size(600, 720));
    setWindowMinSize(const Size(600, 720));
  }else
    {
      setWindowTitle('Calculator');
      setWindowMaxSize(const Size(1280, 720));
      setWindowMinSize(const Size(1280, 720));
    }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scientific Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Main_screen.route: (_) => Main_screen(),
          Scientific.route: (_) => Scientific(),
          Converters_File.route: (_) => Converters_File(),
        },
        home: Main_screen());
  }
}
