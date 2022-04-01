import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_menu_back_panel/widgets/page_widgets/menu_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB8ia9ijWnLcrjZpIrw_uiWgOD2mr_n2I4",
      appId: "1:1091647534392:web:95eeb77b08d0a03e583dcd",
      messagingSenderId: "1091647534392",
      projectId: "generic-restaurant-menu",
      storageBucket: "generic-restaurant-menu.appspot.com",
      authDomain: "generic-restaurant-menu.firebaseapp.com"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantMenuPageWidget(),
    );
  }
}
