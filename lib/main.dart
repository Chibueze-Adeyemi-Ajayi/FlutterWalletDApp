import 'dart:async';
import 'dart:convert';

import 'package:etherum_wallet_mobile_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

// main fun
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

var address, private_key;

class _MyHomePageState extends State<MyHomePage> {

  int screen = 0;

  // creating wallet
  Future <dynamic> createWallet () async {
    String url = "https://ethereum-web3-server.onrender.com/wallet/create";
    var response = await http.post(Uri.parse(url));
    var data = json.decode(response.body);
    var data_arr = [data["address"], data["private_key"]];
    return data;
  }
 
  Widget getCurrentScreen (int index) {
    return <Widget> [
        // loader
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/img/eth.png", width: 250, height: 250,),),
              Container(height: 20,),
              const Text("Ethereum Wallet", style: TextStyle(color: Colors.blueAccent, fontSize: 35, fontWeight: FontWeight.bold)),
              Container(height: 20,),
              FutureBuilder(
                future: createWallet(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasError) {
                    Timer(Duration(seconds: 1), () {
                      setState(() {
                        var data = json.decode(json.encode(snapshot.data)); //data = data[0];; 
                        address = data["address"]; private_key = data["private_key"];
                        print(data["address"]);
                        //screen = 1;
                      });
                    });
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(child: Text("Please check your internet connections and retry", style: TextStyle(color: Colors.redAccent, fontSize: 20,)),),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 173, 173),
                        border: Border.all(color: Colors.redAccent),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    );
                  }
                } return CircularProgressIndicator();
              })
            ],
          ),
          // home screen
          const Home(address: address, : private_key)
    ][index];
  }

  @override
  void initState() {
    // Timer(const Duration(seconds: 5), () {
    //   setState(() {
    //     screen = 1;
    //   });
    // });
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
