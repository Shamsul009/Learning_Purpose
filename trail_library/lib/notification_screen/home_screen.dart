import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trail_library/notificationservice/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String deviceTokentoSendNotification = "";
  @override
  void initState() {
    super.initState();

    //when app is terminate or totally close
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("New Notification");
      }
    });

    //when app is running
    FirebaseMessaging.onMessage.listen((message) {
      print("FirebaseMessaginig.onMessage");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message detail ${message.data}");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Firebase.onMessagingOpenedApp.Listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data ${message.data['_id']}");
        LocalNotificationService.createanddisplaynotification(message);
      }
    });
  }

  Future<void> getDeviceTokentoSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokentoSendNotification = token.toString();
    print("$deviceTokentoSendNotification");
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokentoSendNotification();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notificaiton App"),
      ),
      body: const Center(
        child: Text("Push Notification"),
      ),
    );
  }
}



