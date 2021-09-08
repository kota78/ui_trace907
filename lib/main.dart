import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String title = "Stay With Me";
String artist = "Sam Smith";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

  int height = 180;
  bool _play = false;
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //Positioned.fill(child: Image.asset('assets/', fit: BoxFit.fill,),),
        Positioned.fill(child: Container(color: Colors.black,),),
        Column(children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(onTap: (){}, child: Icon(Icons.arrow_downward, color: Colors.white, size: 40,)),
              ),
              Text("Sam Smith", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(onTap: (){}, child: Icon(Icons.cancel, color: Colors.white, size: 30,)),
              ),
            ],
          ),
          Expanded(child: Container()),
          Expanded(flex: 5,child: Container(child: Image.asset("assets/picture.jpg"))),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(artist, style: TextStyle(color: Colors.grey, fontSize: 15),),
                  ),
                ],
              ),
              (() {
                if (_favorite == false) {
                  return InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.white,
                      onTap: (){
                        setState(() {
                          _favorite = true;
                        });
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      )
                  );
                } else {
                  return InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.white,
                      onTap: (){
                        setState(() {
                          _favorite = false;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      )
                  );
                }
              })(),
            ],
          ),
          Expanded(child: Container()),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(child: Icon(Icons.cancel, color: Colors.white,)),
              Icon(Icons.arrow_left, color: Colors.white, size: 50,),
              (() {
                if (_play == false) {
                  return InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.white,
                      onTap: (){
                        setState(() {
                          _play = true;
                        });
                      },
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                        size: 70,
                      )
                  );
                } else {
                  return InkWell(
                      highlightColor: Colors.white,
                      splashColor: Colors.white,
                      onTap: (){
                        setState(() {
                          _play = false;
                        });
                      },
                      child: Icon(
                        Icons.stop,
                        color: Colors.white,
                        size: 70,
                      )
                  );
                }
              })(),
              Icon(Icons.arrow_right, color: Colors.white, size: 50,),
              Icon(Icons.camera, color: Colors.white,),
            ],
          ),
          Expanded(child: Container()),
          Slider(
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          Expanded(child: Container()),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.hardware, color: Colors.white,),
              Icon(Icons.list, color: Colors.white,)
            ],),
          Expanded(child: Container()),
        ],),
      ],),
    );
  }
}
