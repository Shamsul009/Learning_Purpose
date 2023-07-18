import 'dart:js';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:trail_library/OTP_SYSTEM/otp.dart';
import 'package:trail_library/OTP_SYSTEM/phone.dart';
import 'package:trail_library/Payment_System/sslpaymet.dart';
import 'package:trail_library/notification_screen/home_screen.dart';
import 'package:trail_library/notificationservice/local_notification_service.dart';
//import './time.dart';
//import 'image.dart';
import 'facebookNotification.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: 'phone',
//     routes: {'phone': (context) => MyPhone(), 
//             'otp': (context) => MyOtp()
//     },
//   ));
// }

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//   LocalNotificationService.initialize();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Uint8List? exportedImage;

//   SignatureController controller = SignatureController(
//     penStrokeWidth: 3,
//     penColor: Colors.red,
//     exportBackgroundColor: Colors.yellowAccent,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Signature Pad Example"),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Signature(
//               controller: controller,
//               width: 350,
//               height: 200,
//               backgroundColor: Colors.lightBlue[100]!,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                     padding: EdgeInsets.all(10),
//                     child: ElevatedButton(
//                         onPressed: () async {
//                           exportedImage = await controller.toPngBytes();
//                           //API
//                           setState(() {});
//                         },
//                         child: const Text(
//                           "Save",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.red),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: BorderSide(color: Colors.red)))))),
//                 Padding(
//                     padding: EdgeInsets.all(10),
//                     child: ElevatedButton(
//                         onPressed: () {
//                           controller.clear();
//                         },
//                         child: const Text(
//                           "Clear",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.blue),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(18.0),
//                                     side: BorderSide(color: Colors.red)))))),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             if (exportedImage != null)
//               Image.memory(
//                 exportedImage!,
//                 width: 300,
//                 height: 250,
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }