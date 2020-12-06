import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_visitors/provider/provider.dart';
import 'package:online_visitors/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BrainProvider>(
      create: (context) => BrainProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[700]),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
