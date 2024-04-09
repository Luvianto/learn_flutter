import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:learn_flutter/main.dart';

class FirebaseApi {
  // create an instance of the firebase mesaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize Notification
  Future<void> initNotifications() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token (normally you would send this to your server)
    print('Token:$fCMToken');

    // initialize further setting for push notification
    initPushNotification();
  }

  // function to handle received message
  void handleMessage(RemoteMessage? message) {
    // if the message is null, return nothing
    if (message == null) return;

    // navigate to new screen if message is received and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  // function toinitialize foreground and background settings
  Future initPushNotification() async {
    // handle notificatoin if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when the notification open the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
