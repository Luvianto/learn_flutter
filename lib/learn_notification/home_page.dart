import 'package:flutter/material.dart';

class NotifHomePage extends StatefulWidget {
  const NotifHomePage({super.key});

  @override
  State<NotifHomePage> createState() => _NotifHomePageState();
}

class _NotifHomePageState extends State<NotifHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
    );
  }
}
