import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/components/data_type.dart';
import 'package:flutter_dart_learn/components/opp_learn.dart';
import 'package:flutter_dart_learn/components/function_learn.dart';
import 'package:flutter_dart_learn/components/skills_learn.dart';
import 'package:flutter_dart_learn/components/plugin_use.dart';
import 'package:flutter_dart_learn/components/less_group_page.dart';
import 'package:flutter_dart_learn/components/flutter_layout.dart';
import 'package:flutter_dart_learn/components/gesture_page.dart';

class LearnList extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_LearnList();
}

class _LearnList extends State<LearnList> {
  //变量标记是否用路由名字跳转
  bool byName = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(height: 20,),
          SwitchListTile(
              title: Text("${byName?'':'不'}使用路由名称跳转"),
              value: byName, onChanged: (value){
            setState(() { byName = value;});
          }),
          SizedBox(height: 20,),
          _Card("常用数据类型", DartType(), 'type'),
          _Card("构造方法", OppLearn(), 'opp'),
          _Card("函数/方法", FuntionLearnPage(), 'functions'),
          _Card("Dart编程技巧", SkillsLearn(), 'skills'),
          _Card("flutter插件的使用", PluginUse(), 'plugins'),
          _Card("StateLessWidget与基础组件", LessgroupPage(title: "StateLessWidget与基础组件"), 'less'),
          _Card("StateLessWidget布局", FlutterLayout(title: "StateLessWidget布局"), 'layout'),
          _Card("Expanded的使用", UseExpanded(title: "Expanded的使用"), 'expanded'),
          _Card("Flutter手势监听", GesturePage(title:"Flutter手势监听"), 'gesture'),
        ],
      ),
    );
  }

  ///這裏根據字段byName判断是根据路由组件直接跳转还是通过提前配置的路有名字跳转
  _Card(String title,Widget page, String routeName){
    return  new Card(
      child: ListTile(
        title: Text(title),
        onTap: (){
          if(byName){
            print("*****路有名字跳转$routeName");
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (content)=> page));
          }
        },
      ),
    );
  }
}

