import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router_learn/src/websocket.dart';
import './src/flutter_widget_lifecycle.dart';
import './src/http.dart';
import './src/websocket.dart';
import './src/photo.dart';
import './src/grid_view_demo.dart';
import './src/animate.dart';
import './src/test.dart';
import './src/platform_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        "life":(BuildContext context)=> WidgetLifeCycle(),
        "photo":(BuildContext context)=> PhotoPage(),
        "http":(BuildContext context)=> HttpDemo(),
        "websocket":(BuildContext context)=> WebSocketDemo(),
        "gridview":(BuildContext context)=> GridViewDemo(),
        "animate":(BuildContext context)=> ScaleAnimationRoute(),
        "test":(BuildContext context)=> TestApp(),
        "platform":(BuildContext context)=> PlatformChannel(),
      },
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _Card("1.生命周期了解一下", "life"),
          _Card("2.拍照", "photo"),
          _Card("3.HTTP", "http"),
          _Card("4.websocket", "websocket"),
          _Card("5.网格布局", "gridview"),
          _Card("6.动画", "animate"),
          _Card("7.测试 hello world", "test"),
          _Card("8.测试 platform", "platform"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  _Card(String title, String routeName){
      return   GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, routeName,arguments: title);
        },
        child:  Card(
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(title),
          ),
        ),
      );
  }
}
