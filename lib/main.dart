// import 'package:flutter/material.dart';
// import 'package:learn_provider/learn_provider/counter_model.dart';
// import 'package:learn_provider/learn_provider/home_page.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => CounterModel(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: 'PROVIDER',),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/firebase_options.dart';
import 'package:learn_flutter/learn_notification/api/firebase_api.dart';
import 'package:learn_flutter/learn_notification/home_page.dart';
import 'package:learn_flutter/learn_notification/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotifHomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
