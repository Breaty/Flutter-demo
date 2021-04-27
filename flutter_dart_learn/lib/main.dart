import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_dart_learn/components/learn_view.dart';
import 'package:flutter_dart_learn/components/data_type.dart';
import 'package:flutter_dart_learn/components/opp_learn.dart';
import 'package:flutter_dart_learn/components/function_learn.dart';
import 'package:flutter_dart_learn/components/skills_learn.dart';
import 'package:flutter_dart_learn/components/plugin_use.dart';
import 'package:flutter_dart_learn/components/less_group_page.dart';
import 'package:flutter_dart_learn/components/flutter_layout.dart';
import 'package:flutter_dart_learn/components/some-widgets.dart';
import 'package:flutter_dart_learn/components/gesture_page.dart';


void main() {
  runApp(MyApp());

  if(Platform.isAndroid){
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Study",
      home: NavigatorConfig(),
    );
  }
}

//这是一个路由配置以及tabbar配置的文件
class NavigatorConfig extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigatorConfig();
}

class _NavigatorConfig extends State<NavigatorConfig> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "Flutter Learning",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes:{
          "type":(BuildContext context)=>DartType(),
          "opp":(BuildContext context)=>OppLearn(),
          "functions":(BuildContext context)=>FuntionLearnPage(),
          "skills":(BuildContext context)=>SkillsLearn(),
          "plugins":(BuildContext context)=>PluginUse(),
          "layout":(BuildContext context)=>LessgroupPage(title: "StateLessWidget布局"),
          "less":(BuildContext context)=>FlutterLayout(title: "StateLessWidget与基础组件"),
          "expanded":(BuildContext context)=>UseExpanded(title: "Expanded的使用"),
          "widgets":(BuildContext context)=>SomeWidgetChild(title:"一些常用组件"),
          "gesture":(BuildContext context)=>GesturePage(title:"Flutter手势监听"),
        },
        home: Scaffold(
          // appBar: AppBar(title: Text("StateLessWidget learn")),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                label: "首页",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  label: "列表"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text("点我"),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(child: new HomePage(), onRefresh: _handleRefresh)
              : new LearnList(),
        ));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    return null;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
    TextStyle(fontSize: 20, color: Colors.deepOrangeAccent);
    // TODO: implement build
    return Column(
      children: [
        new Container(
          height: 200,
          child: PageView(
            allowImplicitScrolling: true,
            children: <Widget>[
              _item('常用组件', Colors.deepOrangeAccent),
              _item('构造函数', Colors.deepOrange),
              _item('路由配置', Colors.amberAccent),
            ],
          ),
        )
      ],
    );
  }

  _item(String title, Color color) {
    return Container(
        decoration: BoxDecoration(color: color),
        alignment: Alignment.center,
        child:
        Text(title, style: TextStyle(color: Colors.white, fontSize: 22)));
  }
}