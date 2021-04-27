import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/components/utils.dart';
import 'package:flutter_dart_learn/components/generic_learn.dart';

// 方法的构成
// 返回值 + 方法名 + 参数
// 其中 返回值可以缺省 也可以为void或者具体的类型
// 方法名： 匿名方法不需要方法名
// 参数：分为必选参数、可选参数，参数定义分为参数类型和参数名，擦书类型可以缺省

import 'package:flutter/material.dart';

class FunctionLearn {

  int sum(int val1, int val2){
    return val1+val2;
  }

  ///私有方法，通过下划线标识，仅能在当前dart文件中使用，同一个dart文件，其他函数内部也可以调用
  _learn(){
    print("私有方法");
  }

  anomymousFunction(){
    var list = ["私有方法","匿名方法"];
    list.forEach((i) {
      ///这里forEach中的回调方法就是一个匿名方法
      print(list.indexOf(i).toString() +":"+i);
    });
  }
}

class Testfunction {
  FunctionLearn functionLearn =  FunctionLearn();
  void start(){
    print(functionLearn.sum(10, 15));
    functionLearn.anomymousFunction();
  }
}

class FuntionLearnPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ///Dart函数
    _functionLearn();
    ///泛型在函数中的应用
    _genericLearn();


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Dart 函数方法"),),
      body: new Container(
        child: new ListView(
          children: <Widget>[
              ListTile(
                title: Text("一、方法的构成"),
              ),
            ListCustomItemCard(contents: [
              "构成：返回值 + 方法名 + 参数",
              "返回值：其中返回值可以缺省也可以为void或者具体的类型",
              "方法名： 匿名方法不需要方法名",
              "参数：分为可选参数和必选参数和参数默认值， 定义分为参数类型和参数名， 参数类型可以缺省"
            ]),
            ListCustomItemCard(contents: [
              "私有方法和私有属性",
              "Dart中使用下划线标识私有方法和私有属性",
              "只有在定义该死有方法的dart文件中可以访问私有方法(属性)（并不是只有在函数内部，而是同一个dart文件）"
            ]),
            ListTile(
              title: Text("二、入口函数"),
              subtitle: Text("  main.dart 中的main方法"),
            ),
            ListTile(
              title: Text("三、泛型在函数中的应用"),
              subtitle: Text("  型检查约束类比：List<String>"),
            ),
            ListCustomItemCard(contents: [
              "通俗理解：泛型主要是解决类、接口、方法的复用性、以及对不特定数据类型的支持",
              "代码参见方法_genericLearn"
            ]),
          ],
        ),
      ),
    );
  }

  //Dart方法
  void _functionLearn(){
    Testfunction testfunction = Testfunction();
    testfunction.start();
  }

  //泛型
  void _genericLearn(){
      TestGeneric testGeneric =  new TestGeneric();
      testGeneric.start();
  }
}