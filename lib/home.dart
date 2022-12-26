import 'package:etherum_wallet_mobile_app/fragments/about.dart';
import 'package:etherum_wallet_mobile_app/fragments/market-cap.dart';
import 'package:etherum_wallet_mobile_app/fragments/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int state__ = 0;
  List fragments = const <Widget> [
    MarketCap(), MyWallet(), About()
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .1,
        actions:  <Widget> [
        IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        PopupMenuButton(
          color: Colors.white,
          itemBuilder: (context) {
          return const <PopupMenuItem> [
            PopupMenuItem(child: ListTile(leading: Icon(CupertinoIcons.graph_square), iconColor: Colors.blueAccent, title: Text("Market cap"),)),
            PopupMenuItem(child: ListTile(leading: Icon(CupertinoIcons.money_dollar_circle), iconColor: Colors.blueAccent, title: Text("Wallet"),)),
            PopupMenuItem(child: ListTile(leading: Icon(CupertinoIcons.info_circle), iconColor: Colors.blueAccent, title: Text("About"),))
          ];
        })
      ],
        backgroundColor: Colors.blueAccent,
        title: const Text("EthereumWallet"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane),),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, elevation: 20,
        onTap: (value) {setState(() {
          state__ = value;
        });},
        fixedColor: Colors.grey,
        items: <BottomNavigationBarItem> [
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.graph_square, color: ((state__ == 0)? Colors.blueAccent : Colors.grey),), label: 'Market'),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.money_dollar, color: ((state__ == 1)? Colors.blueAccent : Colors.grey),), label: 'Wallet'),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.info_circle, color: ((state__ == 2)? Colors.blueAccent : Colors.grey),), label: 'About'),
        ]
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: fragments[state__]
      ) 
    );
  }
}
