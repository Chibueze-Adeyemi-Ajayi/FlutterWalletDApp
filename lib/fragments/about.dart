import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 253, 240, 240), borderRadius: BorderRadius.all(Radius.circular(3)), border: Border.all(color: Colors.redAccent)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
                child: Text("Attention\n\nThis Decentralized Application (DApp) was built on Goerli Ethereum Testnet, which implies that no real Ethereum fund can be sent or received using this wallet\n", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 189, 6, 6)),),
              ),
              Container(height: 20,),
              Text("Developer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              Container(height: 10,),
              Text("Ajayi Chibueze Adeyemi", style: TextStyle(fontSize: 20),),     
              Container(height: 20,),
              Text("Company", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              Container(height: 10,),
              Text("Jilo Innovations", style: TextStyle(fontSize: 20),),
            ],
          )
        ),
      ) 
    );
  }
}
