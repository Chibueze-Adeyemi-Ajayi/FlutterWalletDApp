import 'dart:async';

import 'package:etherum_wallet_mobile_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => const Home()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int screen = 0;

  Widget getCurrentScreen (int index) {
    return <Widget> [
        // loader
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/img/eth.png", width: 250, height: 250,),),
              Container(height: 20,),
              const Text("Ethereum Wallet", style: TextStyle(color: Colors.blueAccent, fontSize: 35, fontWeight: FontWeight.bold))
            ],
          ),
          // home screen
          const Home()
    ][index];
  }
 
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      setState(() {
        screen = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: getCurrentScreen(screen)
        ),
      ) 
    );
  }
}
