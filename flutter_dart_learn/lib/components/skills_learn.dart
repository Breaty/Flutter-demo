
///面向对象的编程
/// 一、封装 不局限于类的封装  还有代码块的封装
/// 二、继承 通过继承实现代码复用
/// 三、多态 父类的代码不满足我们的需求的时候，就重写
///
/// 总结
/// 我们要善于封装、大到功能模块的封装，小到方法的封装， 封装的目的在于复用和易于扩展和维护
/// 不要在一个方法体里面堆砌太多的代码，一般 < 100行

/// 另外，点点点的技巧
/// 在一个类的世界里，我们万物皆对象， 1点看对象有哪些方法的属性， 2点看源码 3点看究竟

import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/components/utils.dart';

void TestSkillsLearn(){
  List list;
  print("----------dart技巧---- start------");

  //dart技巧1： 安全的调用
  //对于我们不确定是否为空的对象可以通过?.的方式来访问他的属性和方法防治空异常 a?.foo()

  // print(list.length);//这样会报错 list是null
  print(list?.length);//这样就ok啦

  //dart技巧2： 设置默认值
  print(list?.length??0);//设置一个默认值

  //Dart技巧3：需要判断的值太多的情况话，使用[].contains(value)判断
  list = [];
  list.add(0);
  list.add('');
  list.add(null);

  //这样很复杂很长的样子
  if( list[0] == null ||list[0] == '' || list[0] == 0 ){
      print("list[0] is empty");
  }

  //这样更简单哦
  if(['',0,null].contains(list[1])){
    print("---hehe----list[0] is empty");
  }

  List list_higher_order = <String>['aaa','bbb','ccc','ddd'];

  //技巧4：不要使用length判断集合是不是为空，使用isNotEmpty或者isEmpty
  if(list_higher_order.isNotEmpty){
      //技巧五：where遍历会返回一个符合条件语句的单项或者多项，并不会改变原本的List
      var tt = list_higher_order.where((element) => element!='ccc');
      print("where的返回值$tt");
      print("原对象好像并没有被修改了：$list_higher_order");
  }


  //技巧五：whereType可以筛选你想要的数据类型
  List ListTypes = [1,3,'aaa',true,6,'bbb'];
  var intList = ListTypes.whereType<int>();
  print("是不是都是int了啊$intList");

  print("----------dart技巧---- end------");
}

class SkillsLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _test();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Dart编程技巧")),
      body: Container(
          child: new ListView(
            padding: EdgeInsets.only(bottom: 60),
            children: <Widget>[
              new ListTile(
                title: Text("一、安全的调用"),
                subtitle: Text("  善用?.防空异常"),
              ),
              ListCustomItemCard(contents: [
                "对于我们不确定是否为空的对象可以通过?.的方式来访问他的属性和方法防治空异常 a?.foo()"
              ]),
              new ListTile(
                title: Text("二、设置默认值"),
                subtitle: Text("  善用??设置默认值"),
              ),
              ListCustomItemCard(contents: [
                "print(list?.length??0)"
              ]), new ListTile(
                title: Text("三、判断值的类型"),
                subtitle: Text("  需要判断的值太多的情况话，使用[].contains(value)判断"),
              ),
              ListCustomItemCard(contents: [
                "if(['',0,null].contains(list[1])){ \n         print('list[0] is empty')\n     }"
              ]),
              new ListTile(
                title: Text("四、空值判断"),
                subtitle: Text("不要使用length判断集合是不是为空，使用isNotEmpty或者isEmpty"),
              ),
              new ListTile(
                title: Text("五、where也可以达到map的效果"),
              ),
              ListCustomItemCard(contents: [
                  'if(list_higher_order.isNotEmpty){\n'
                    '     //where遍历会返回一个符合条件语句的单项或者多项，并不会改变原本的List\n'
                    '     var tt = list_higher_order.where((element) => element!="ccc");\n'
                    '     print("where的返回值\$tt");\n'
                    '     print("原对象好像并没有被修改了：\$list_higher_order");\n'
                    '}'
              ]),
              new ListTile(
                title: Text("六、使用whereType按类型过滤集合"),
              ),
              ListCustomItemCard(contents: [
                "筛选返回你想要的类型的数据:\n",
                " objects.whereType<int>();"
              ]),
              new ListTile(title: Text("七、使用 final 关键字来创建只读属性。"),
              ),
              ListCustomItemCard(contents: [
                "如果你有一个变量，对于外部代买来说只能读取不能修改， 最简单的做法就是使用 final 关键字来标记这个变量。:\n",
                "class Box {\n"
                "     final contents = [];\n"
                "}"
              ])
            ],
          ),
      ),
    );
  }

  _test(){
    TestSkillsLearn();
  }
}

