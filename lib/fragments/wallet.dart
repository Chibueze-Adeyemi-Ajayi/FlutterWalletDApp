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
                          onPressed: () {}, icon: Icon(CupertinoIcons.arrow_up_circle_fill, size: 50, color: Colors.white,)),
                        IconButton(
                          tooltip: "Exchange",
                          onPressed: () {}, icon: Icon(CupertinoIcons.arrow_up_arrow_down_square_fill, size: 50, color: Colors.white,)),
                        IconButton(
                          tooltip: "Receiver",
                          onPressed: () {}, icon: Icon(CupertinoIcons.arrow_down_circle_fill, size: 50, color: Colors.white,)),
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
