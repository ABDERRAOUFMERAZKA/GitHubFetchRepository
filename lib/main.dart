import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Navigation/navigation.dart';
import './providers/listRepoProviders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ListReposProvider(),
        )
      ],
      child: MaterialApp(
        home: Tabs(),
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlue),
          ),
        ),
      ),
    );
  }
}
