import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWalletPage(),
    );
  }
}

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({Key? key}) : super(key: key);
  @override
  State<MyWalletPage> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWalletPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(child: 
          Column(children: [
            Container(
                color: Color.fromRGBO(68, 138, 255, 1), 
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Wallet Balance", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Container(height: 20,),
                    Text("3.17ETH", style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),),
                    Container(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: "Transfer",
                          onPressed: () {
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
                          }, icon: Icon(CupertinoIcons.arrow_up_circle_fill, size: 50, color: Colors.white,)),
                        IconButton(
                          tooltip: "Exchange",
                          onPressed: () {
                            var dialog = showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text("Ethereum Exchange", style: TextStyle(color: Colors.blueAccent),),
                                content: Text("Unfortunately this version can not exchange your, visit uniswap.com please"),
                                actions: [TextButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Row(children: [
                                  Icon(Icons.close, color: Colors.blueAccent), Container(width: 10,),
                                  Text("Close")
                                ],))],
                              );
                            });
                          }, icon: Icon(CupertinoIcons.arrow_up_arrow_down_square_fill, size: 50, color: Colors.white,)),
                        IconButton(
                          tooltip: "Receiver",
                          onPressed: () {
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
                          }, icon: Icon(CupertinoIcons.arrow_down_circle_fill, size: 50, color: Colors.white,)),
                      ],
                    ),
                  ],
                ),),),
                Container(height: 85, 
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset("assets/img/btc.png", width: 60, height: 60,),
                      Container(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("BTC", style: TextStyle(fontSize: 25),),
                        Text("0.175BTC",  style: TextStyle(fontSize: 18),),
                      ],)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width, decoration: BoxDecoration(
                  color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey, width: 0.25)),
                ),), Container(height: 1,),
                Container(height: 85, 
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset("assets/img/bnb_real.png", width: 50, height: 50,),
                      Container(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("BNB", style: TextStyle(fontSize: 25),),
                        Text("1.471BNB",  style: TextStyle(fontSize: 18),),
                      ],)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width, decoration: BoxDecoration(
                  color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey, width: 0.25)),
                ),),
                Container(height: 1,),
                Container(height: 85, 
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(width: 10,),
                      Image.asset("assets/img/xrp.png", width: 40, height: 40,),
                      Container(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("XRP", style: TextStyle(fontSize: 25),),
                        Text("0.01471XRP",  style: TextStyle(fontSize: 18),),
                      ],)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width, decoration: BoxDecoration(
                  color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey, width: 0.25)),
                ),),
                Container(height: 1,),
                Container(height: 85, 
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset("assets/img/ltc.png", width: 50, height: 50,),
                      Container(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("LTC", style: TextStyle(fontSize: 25),),
                        Text("1.471LTC",  style: TextStyle(fontSize: 18),),
                      ],)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width, decoration: BoxDecoration(
                  color: Colors.white, border: Border(bottom: BorderSide(color: Colors.grey, width: 0.15)),
                ),)
          ],)),
        )
      ) 
    );
  }
}
