import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarketCap extends StatelessWidget {
  const MarketCap({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MarketCapPage(),
    );
  }
}

class MarketCapPage extends StatefulWidget {
  const MarketCapPage({Key? key}) : super(key: key);
  @override
  State<MarketCapPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MarketCapPage> {

  @override
  void initState() {
    super.initState();
  }

  var webview_controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: SingleChildScrollView(child: Column(
            children: <Widget> [
              Container(
                color: Color.fromRGBO(68, 138, 255, 1), 
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Market Cap", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Container(height: 20,),
                    Text("1,000USD", style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),),
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
                            webview_controller = WebViewController()
                            ..setJavaScriptMode(JavaScriptMode.unrestricted)
                            ..setBackgroundColor(const Color(0x00000000))
                            ..setNavigationDelegate(
                              NavigationDelegate(
                                onProgress: (int progress) {
                                  // Update loading bar.
                                },
                                onPageStarted: (String url) {},
                                onPageFinished: (String url) {},
                                onWebResourceError: (WebResourceError error) {},
                                onNavigationRequest: (NavigationRequest request) {
                                  if (request.url.startsWith('https://www.youtube.com/')) {
                                    return NavigationDecision.prevent;
                                  }
                                  return NavigationDecision.navigate;
                                },
                              ),
                            )
                            ..loadRequest(Uri.parse('https://flutter.dev'));
                            showCupertinoModalPopup(context: context, builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(15), color: Colors.white,
                                child: WebViewWidget(controller: webview_controller),
                              );
                            });
                          }, icon: Icon(CupertinoIcons.arrow_up_arrow_down_square_fill, size: 50, color: Colors.white,)),
                        IconButton(
                          tooltip: "Receiver",
                          onPressed: () {}, icon: Icon(CupertinoIcons.arrow_down_circle_fill, size: 50, color: Colors.white,)),
                      ],
                    )
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
            ],
          )),
        ),
      ) 
    );
  }
}
