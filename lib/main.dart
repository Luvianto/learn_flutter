import 'package:flutter/material.dart';
import 'package:learn_provider/counter_model.dart';
import 'package:learn_provider/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  // if you have more than one class that extends ChangeNotifier
  // you need to use MultiProvider instead of ChangeNotifierProvider.
  // MultiProvider(
  //    providers: [
  //      ChangeNotifierProvider(
  //        create: (context) => CounterModel(),
  //        child: const MyApp(),
  //      )
  //    ]
  // )
  //
  // Remember that you need to avoid placing the ChangeNotifierProvider
  // higher than necessary in the widget tree
  // otherwise you will pollute the scope.
  runApp(ChangeNotifierProvider(
    create: (context) => CounterModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
