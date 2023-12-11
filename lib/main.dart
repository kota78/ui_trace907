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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //Positioned.fill(child: Image.asset('assets/', fit: BoxFit.fill,),),
              Positioned.fill(
                child: Container(
                  color: Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.expand_more,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Text(
                          "Sam Smith",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Image.asset(
                      "assets/picture.jpg",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                artist,
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        (() {
                          if (_favorite == false) {
                            return InkWell(
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _favorite = true;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                ));
                          } else {
                            return InkWell(
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _favorite = false;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                ));
                          }
                        })(),
                      ],
                    ),
                    SizedBox(height: 12),
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            child: Icon(
                          Icons.shuffle,
                          color: Colors.white,
                        )),
                        Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 50,
                        ),
                        (() {
                          if (_play == false) {
                            return InkWell(
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _play = true;
                                  });
                                },
                                child: Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.white,
                                  size: 70,
                                ));
                          } else {
                            return InkWell(
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {
                                  setState(() {
                                    _play = false;
                                  });
                                },
                                child: Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                  size: 70,
                                ));
                          }
                        })(),
                        Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 50,
                        ),
                        Icon(
                          Icons.repeat,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.speaker_group,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.list,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
