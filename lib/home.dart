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
          return <PopupMenuItem> [
            PopupMenuItem(onTap: () {
              setState(() {
                state__ = 0;
              });
            }, child: ListTile(leading: Icon(CupertinoIcons.graph_square), iconColor: Colors.blueAccent, title: Text("Market cap"),)),
            PopupMenuItem(child: ListTile(onTap: () {
              setState(() {
                state__ = 1;  
              });  
            }, leading: Icon(CupertinoIcons.money_dollar_circle), iconColor: Colors.blueAccent, title: Text("Wallet"),)),
            PopupMenuItem(
              onTap: () {
                showModalBottomSheet(
                              useRootNavigator: true,
                              context: context, builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white, 
                                child: Column(
                                  children: [
                                    Container(height: 20,),
                                    Text("Ethereum Transfer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Color.fromARGB(255, 59, 59, 59)),),
                                    Container(height: 50,),
                                    TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                        hintText: "Wallet Address",
                                        label: Text("Receipent Ethereum Wallet Address"),
                                        suffixIcon: Icon(Icons.card_giftcard, color: Colors.blueAccent,)
                                      ),
                                    ), Container(height: 20,),
                                    TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                        hintText: "Amount of Ether",
                                        label: Text("How much Ethereum to transfer"),
                                        suffixIcon: Icon(Icons.currency_exchange_rounded, color: Colors.blueAccent,)
                                      ),
                                    ), Container(height: 20,),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                                      onPressed: () {}, child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("SEND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                        Container(width: 20,),
                                        Icon(Icons.send, color: Colors.white)
                                      ],
                                    ))
                                  ],
                                ),
                              );
                            });
              },
              child: ListTile(
              iconColor: Colors.blueAccent,
              leading: Icon(CupertinoIcons.arrow_up_circle),
              title: Text("Transfer ETH"),
            )),
            PopupMenuItem(
              onTap: () {
                var sheet_dialog = showModalBottomSheet(
                              useRootNavigator: true,
                              context: context, builder: (context) {
                                return Column(
                                  children: [
                                    Container(height: 15,),
                                    Text("Wallet Address", style: TextStyle(fontSize: 22),),Container(height: 15,),
                                    Text("0xff467f24a1124vun0345", style: TextStyle(fontSize: 20),),Container(height: 15,),
                                    Container(height: 15, decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Color.fromARGB(255, 199, 196, 196))),
                                    ),),Container(height: 15,),
                                    ListTile(
                                      leading: Icon(Icons.copy, color: Colors.blueAccent,), title: Text("Copy Address"),
                                    ),
                                    ListTile(
                                      leading: Icon(CupertinoIcons.money_dollar_circle_fill,  color: Colors.blueAccent), title: Text("\$1,0000"),
                                    ),Container(height: 5,),
                                    Container(height: 15, decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Color.fromARGB(255, 233, 232, 232))),
                                    ),),Container(height: 25,),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(54, 16, 54, 16)),
                                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }, child: Text("Close", style: TextStyle(color: Colors.white, fontSize: 20),))
                                  ],
                                );
                            });
              },
              child: ListTile(
              iconColor: Colors.blueAccent,
              leading: Icon(CupertinoIcons.arrow_down_circle),
              title: Text("Receive ETH"),
            )),
            PopupMenuItem(onTap: () {
              setState(() {
                state__ = 2;
              });
            }, child: ListTile(leading: Icon(CupertinoIcons.info_circle), iconColor: Colors.blueAccent, title: Text("About"),))
          ];
        })
      ],
        backgroundColor: Colors.blueAccent,
        title: const Text("EthereumWallet"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
         showModalBottomSheet(
                              useRootNavigator: true,
                              context: context, builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white, 
                                child: Column(
                                  children: [
                                    Container(height: 20,),
                                    Text("Ethereum Transfer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Color.fromARGB(255, 59, 59, 59)),),
                                    Container(height: 50,),
                                    TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                        hintText: "Wallet Address",
                                        label: Text("Receipent Ethereum Wallet Address"),
                                        suffixIcon: Icon(Icons.card_giftcard, color: Colors.blueAccent,)
                                      ),
                                    ), Container(height: 20,),
                                    TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                                        hintText: "Amount of Ether",
                                        label: Text("How much Ethereum to transfer"),
                                        suffixIcon: Icon(Icons.currency_exchange_rounded, color: Colors.blueAccent,)
                                      ),
                                    ), Container(height: 20,),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                                      onPressed: () {}, child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("SEND", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                        Container(width: 20,),
                                        Icon(Icons.send, color: Colors.white)
                                      ],
                                    ))
                                  ],
                                ),
                              );
                            });
      }, child: Icon(CupertinoIcons.paperplane),),
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
