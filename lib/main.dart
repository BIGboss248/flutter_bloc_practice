import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //tip to setup theme change button for your app use !themeChangeButton
    return MaterialApp(); //tip use !matterial app snippet
  }
}

